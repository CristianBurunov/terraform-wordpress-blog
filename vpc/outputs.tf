output "output_vpc_id" {
    value = aws_vpc.vpc.id
}
output "output_vpc_cidr" {
    value = aws_vpc.vpc.cidr_block
}
# output "output_public_subnet_id" {
#     value = aws_subnet.public[0].id
# }
# output "output_private_subnet_id" {
#     value = aws_subnet.private[0].id
# }
# output "output_public_subnet_id2" {
#     value = aws_subnet.public[1].id
# }
# output "output_private_subnet_id2" {
#     value = aws_subnet.private[1].id
# }
output "output_public_subnet_id" {
    value = aws_subnet.public[*].id
}
 output "output_private_subnet_id" {
     value = aws_subnet.private[*].id
}
output "output_public_cidr"{
    value = aws_subnet.public[*].cidr_block
}
output "output_private_cidr"{
    value = aws_subnet.private[*].cidr_block
}
output "igw_id" {
    value = aws_internet_gateway.igw.id
}
output "rt_public_id" {
    value = aws_route_table.route_table.id
}
output "output_sg_ec2" {
    value = aws_security_group.allow_web.id
}
output "output_sg_rds" {
    value = aws_security_group.sg_rds.id
}


output "key_pair_ec2" {
    value = aws_key_pair.key_pair_ec2
}
output "private_key" {
    value = tls_private_key.private_key
}
output "key_name" {
    value = aws_key_pair.key_pair_ec2.key_name
}
