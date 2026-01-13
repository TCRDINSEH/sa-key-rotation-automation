resource "google_cloud_scheduler_job" "sa_rotation" {
  name      = "sa-key-rotation-job"
  project   = var.project_id
  schedule  = "0 0 */45 * *"
  time_zone = "UTC"

  pubsub_target {
    topic_name = google_pubsub_topic.sa_rotation.id
    data       = base64encode("rotate-sa-keys")
  }
}
