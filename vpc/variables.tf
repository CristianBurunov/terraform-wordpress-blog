variable "vpc_vpc_cidr"{
    type = string
}
# variable "vpc_vpc_id" {
#   type = string
# }
variable "vpc_private_subnets_cidr" {
  type = list(string)
}
variable "vpc_public_subnets_cidr" {
  type = list(string)
}
variable "vpc_az" {
  type = list(string)
}
variable "vpc_ingress_ports" {
    type = list(number)
}
variable "vpc_egress_ports"{
    type = string
}
variable "vpc_egress_protocol"{
    type = string
}
variable "vpc_ingress_protocol"{
    type = string
}
variable "vpc_egress_name"{
    type = string
}
variable "vpc_vpc_name" {
    type = string
}
variable "vpc_sg_name" {
    type = string
}
variable "vpc_sg_description" {
    type = string
}
variable "vpc_rt_name" {
  type = string
}
variable "vpc_igw_name" {
  type = string
}
variable "vpc_rt_cidr_block" {
  type = string
}

