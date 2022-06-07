resource "aws_db_subnet_group" "db_subnet_group"{
    # subnet_ids = [var.db_private_subnet_id, var.db_private_subnet_id2]
    subnet_ids = var.db_private_subnet_id[*]
}
resource "aws_db_instance" "rds"{
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
    allocated_storage    = var.db_db_storage
    engine               = var.db_db_engine
    engine_version       = var.db_db_engine_version
    instance_class       = var.db_db_instance_class
    db_name                 = var.db_db_name
    username             = var.db_db_username
    password             = var.db_db_password
    skip_final_snapshot  = true
    vpc_security_group_ids = [var.db_sg_rds]
    # depends_on = [aws_db_subnet_group.db_subnet_group]
}

# parameter_group_name = var.db_db_parameter_group_name#"default.mysql5.7"
#security_group_names = [var.db_sg_rds]
# db_subnet_group = var.db_db_subnet_group#"db_subnet_group"
# security_group_names = [var.sg_rds]