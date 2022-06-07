variable "ec2_ami" {
    type = string
}
variable "ec2_instance_type" {
    type = string
}
variable "ec2_public_subnet"{
    type = string
}
variable "ec2_ec2_name" {
    type = string
}
variable "ec2_key_name" {
    type = string
}
variable "ec2_ec2_sg" {
    type = string
}
variable "ec2_healthy_threshold"{
    type = string
}
variable "ec2_unhealthy_threshold"{
    type = string
}
variable "ec2_timeout"{
    type = string
}
variable "ec2_interval"{
    type = string
}
variable "ec2_load_balancer_type" {
  type = string
}
variable "ec2_vpc_id" {
  type = string
}
variable "ec2_public" {
  type = list(string)
}
# variable "PUBLIC_KEY_PATH" {
#     type = string
# }
# variable "PRIVATE_KEY_PATH" {
#     type = string
# }
variable "database_user"{
    type = string
}
variable "database_password"{
    type = string
}
variable "database_name"{
    type = string
}
variable "volume_size"{
    type = string
}
variable "volume_type"{
    type = string
}
variable "database_endpoint" {
   type = string
}
    
    