resource "google_monitoring_notification_channel" "slack" {
  display_name = "SA Rotation Slack Alert"
  type         = "webhook"

  labels = {
    url = var.slack_webhook_url
  }
}
