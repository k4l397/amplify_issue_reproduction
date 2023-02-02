variable "access_token_for_repo" {
  type        = string
  sensitive   = true
  description = "Gitlab access token for the dashboard repo."
}

variable "repo_url" {
  type = string
}