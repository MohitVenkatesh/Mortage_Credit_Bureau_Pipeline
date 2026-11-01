resource "snowflake_database" "mortgage" {
  name                        = var.database_name
  comment                     = "Mortgage underwriting reference platform"
  data_retention_time_in_days = 1
}
resource "snowflake_schema" "bronze" {
  database = snowflake_database.mortgage.name
  name     = "BRONZE"
}
resource "snowflake_schema" "silver" {
  database = snowflake_database.mortgage.name
  name     = "SILVER"
}
resource "snowflake_schema" "gold" {
  database = snowflake_database.mortgage.name
  name     = "GOLD"
}
