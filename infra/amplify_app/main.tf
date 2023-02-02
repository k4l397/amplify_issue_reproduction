

resource "aws_amplify_app" "test_app" {
  name       = "test_app"
  repository = "https://github.com/"

  build_spec = file("${path.module}/build.yaml")

  access_token = var.access_token_for_repo

  // Use aws cli to create branches (`aws amplify create-branch --app-id <id> --branch-name <branch>`)
  enable_auto_branch_creation = false
  enable_branch_auto_deletion = true
  enable_branch_auto_build    = true

  dynamic "auto_branch_creation_config" {
    content {
      enable_pull_request_preview = true
      enable_auto_build           = false
      stage                       = "PULL_REQUEST"
    }
  }


  // make spa work
  custom_rule {
    source = "</^[^.]+$|\\.(?!(css|gif|ico|jpg|js|png|txt|svg|woff|ttf|map|json|md)$)([^.]+$)/>"
    status = "200"
    target = "/index.html"
  }

  environment_variables = {
    AMPLIFY_MONOREPO_APP_ROOT : "app"
    AMPLIFY_DIFF_DEPLOY : "true", // only deploy if the app root has changed
  }
}

resource "aws_amplify_branch" "master_app" {
  app_id            = aws_amplify_app.shareholder.id
  branch_name       = "master"
  enable_auto_build = true

  framework = local.framework
  stage     = "PRODUCTION"
}

