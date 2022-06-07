variable "root_region" {
  type = string
}
variable "root_ami" {
  type = string
}
variable "root_instance_type" {
  type = string
}
variable "root_ec2_name" {
  type = string
}
variable "root_vpc_cidr" {
  type = string
}
variable "root_public_subnets_cidr" {
  type = list(string)
}
variable "root_private_subnets_cidr" {
  type = list(string)
}
variable "root_az" {
  type = list(string)
}
variable "root_ingress_ports" {
  type        = list(number)
  description = "list of ingress ports"
}
variable "root_egress_ports" {
  type = string
}
variable "root_egress_protocol" {
  type = string
}
variable "root_ingress_protocol" {
  type = string
}
variable "root_egress_name" {
  type = string
}
variable "root_vpc_name" {
  type = string
}
variable "root_sg_name" {
  type = string
}
variable "root_sg_description" {
  type = string
}
variable "root_rt_name" {
  type = string
}
variable "root_igw_name" {
  type = string
}
variable "root_rt_cidr_block" {
  type = string
}
variable "root_db_storage" {
  type = number
}
variable "root_db_engine" {
  type = string
}
variable "root_db_engine_version" {
  type = string
}
variable "root_db_instance_class" {
  type = string
}
variable "root_db_name" {
  type = string
}
variable "root_db_username" {
  type = string
}
variable "root_db_password" {
  type = string
}
variable "root_db_subnet_group" {
  type = string
}
variable "root_healthy_threshold" {
  type = string
}
variable "root_unhealthy_threshold" {
  type = string
}
variable "root_timeout" {
  type = string
}
variable "root_interval" {
  type = string
}
variable "root_load_balancer_type" {
  type = string
}
# variable "root_PUBLIC_KEY_PATH" {
#   type = string
# }
# variable "root_PRIVATE_KEY_PATH" {
#   type = string
# }
variable "root_key_name" {
  type = string
}
variable "root_volume_size" {
  type = string
}
variable "root_volume_type" {
  type = string
}
# variable "root_database_endpoint" {
#    type = string
# }


# variable "root_sg_rds" {
#   type = list(string)
# }
# variable "root_access_key" {
#   type = string
# }
# variable "root_secret_key" {
#   type = string
# }
# variable "root_db_parameter_group_name" {
#   type = string
# }