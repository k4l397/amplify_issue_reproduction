variable "access_token_for_repo" {
  type        = string
  sensitive   = true
  description = "Gitlab access token for the dashboard repo."
}

variable "prefix" {
  type = string
}

variable "enable_build_preview" {
  type    = bool
  default = false
}

