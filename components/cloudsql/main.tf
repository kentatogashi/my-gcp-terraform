resource "google_sql_database_instance" "master" {
  name = "togashi-${var.env}-mysql01"
  database_version = "MYSQL_5_7"
  region = var.region
  settings {
    tier = "db-f1-micro"
  }
}
