variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "service_accounts" {
  description = "List of service accounts to rotate"
  type        = list(string)
}

variable "notification_email" {
  type = string
}

variable "slack_webhook_url" {
  type      = string
  sensitive = true
}
