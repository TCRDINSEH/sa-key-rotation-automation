resource "google_pubsub_topic" "sa_rotation" {
  name    = "sa-key-rotation-topic"
  project = var.project_id
}
