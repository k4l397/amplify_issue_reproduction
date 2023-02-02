provider "aws" {

}

module "amplify_app" {
  source                = "./amplify_app"
  access_token_for_repo = var.repo_access_token
}

variable "repo_access_token" {
  type = string
}
variable "repo_url" {
  type = string
}