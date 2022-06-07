output "rds_endpoint" {
  value = aws_db_instance.rds.endpoint
}
output "db_id" {
    value  = aws_db_instance.rds.id
}