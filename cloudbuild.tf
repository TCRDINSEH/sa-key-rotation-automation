resource "google_cloudbuild_trigger" "sa_rotation" {
  project = var.project_id
  name    = "sa-key-rotation-trigger"

  pubsub_config {
    topic = google_pubsub_topic.sa_rotation.id
  }

  build {
    step {
      name       = "gcr.io/cloud-builders/gcloud"
      entrypoint = "bash"
      args       = ["-c", file("${path.module}/cloudbuild-sa-rotation.yaml")]
    }

    substitutions = {
      PROJECT_ID       = var.project_id
      SERVICE_ACCOUNTS = join(" ", var.service_accounts)
    }
  }
}
