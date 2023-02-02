provider "aws" {

}

module "amplify_app" {
  source                = "./amplify_app"
  access_token_for_repo = var.repo_access_token
  repo_url              = var.repo_url
}

variable "repo_access_token" {
  type = string
}
variable "repo_url" {
  type = string
}