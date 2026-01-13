resource "google_project_iam_member" "cloudbuild_sa_roles" {
  for_each = toset([
    "roles/iam.serviceAccountKeyAdmin",
    "roles/secretmanager.admin",
    "roles/logging.logWriter"
  ])

  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

data "google_project" "project" {
  project_id = var.project_id
}
