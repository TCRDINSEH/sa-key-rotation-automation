resource "google_monitoring_notification_channel" "email" {
  display_name = "SA Rotation Email Alert"
  type         = "email"

  labels = {
    email_address = var.notification_email
  }
}
