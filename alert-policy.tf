resource "google_monitoring_alert_policy" "sa_rotation_failure" {
  display_name = "SA Key Rotation Failure"

  combiner = "OR"

  conditions {
    display_name = "Cloud Build Rotation Failed"

    condition_threshold {
      filter = <<EOF
metric.type="logging.googleapis.com/user/cloudbuild_build_failure"
resource.type="cloud_build"
EOF

      comparison      = "COMPARISON_GT"
      threshold_value = 0
      duration        = "0s"

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_DELTA"
      }
    }
  }

  notification_channels = [
    google_monitoring_notification_channel.email.id,
    google_monitoring_notification_channel.slack.id
  ]
}

