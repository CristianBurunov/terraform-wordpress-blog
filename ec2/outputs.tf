output "ubuntu" {
    value = aws_instance.ec2.id
    description = "instance"
}

output "ec2_public_ip" {
    value = aws_instance.ec2.public_ip
}

output "ec2_private_ip" {
    value = aws_instance.ec2.public_ip
}

output "eip" {
    value = aws_eip.eip.public_ip
}