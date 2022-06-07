variable "db_db_subnet_group" {
    type = string
  
}
variable "db_db_storage"{
    type = number
}
variable "db_db_engine"{
    type = string
}
variable "db_db_engine_version"{
    type = string
}
variable "db_db_instance_class"{
    type = string
}
variable "db_db_name"{
    type = string
}
variable "db_db_username"{
    type = string
}
variable "db_db_password"{
    type = string
}
variable "db_private_subnet_id" {
    type = list(string)
}
# variable "db_private_subnet_id2" {
#     type = string
# }
variable "db_sg_rds"{
    type = string
}


# variable "db_private_subnets_ids"{
#     type = list(string)
# }
# variable "db_db_parameter_group_name" {
#     type = string
# }