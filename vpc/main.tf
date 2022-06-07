#........................VPC.......................
resource "aws_vpc" "vpc"{
    cidr_block = var.vpc_vpc_cidr

    tags = {
        Name = var.vpc_vpc_name
    }
}
#...................PRIVATE SUBNET..................
resource "aws_subnet" "private" {
  count                   = length(var.vpc_private_subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_private_subnets_cidr[count.index]
  availability_zone       = var.vpc_az[count.index]
  map_public_ip_on_launch = false

  tags = {
    "Name" = "Cristi-sub_priv"
  }
}
#...................PUBLIC SUBNET...................
resource "aws_subnet" "public" {
  count                   = length(var.vpc_public_subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_public_subnets_cidr[count.index]
  availability_zone       = var.vpc_az[count.index]
  map_public_ip_on_launch = true
    tags = {
    "Name" = "Cristi-sub_publ"
  }
}
// Sends your public key to the instance
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}
resource "aws_key_pair" "key_pair_ec2" {
  key_name   = "key_pair_ec2"
  public_key = tls_private_key.private_key.public_key_openssh

  
}

# #.................SECURITY GROUPs..................
resource "aws_security_group" "allow_web" {
    name        = var.vpc_sg_name
    description = var.vpc_sg_description
    vpc_id      = aws_vpc.vpc.id
  
     dynamic "ingress" {
    iterator = port
    for_each = var.vpc_ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.vpc_ingress_protocol
      cidr_blocks = ["0.0.0.0/0"]#var.ingress_cidr
    }
  }
    egress {
      from_port        = var.vpc_egress_ports#0
      to_port          = var.vpc_egress_ports#0
      protocol         = var.vpc_egress_protocol#"-1"
      cidr_blocks      = ["0.0.0.0/0"]#var.ingress_cidr
    }
    tags = {
      Name = var.vpc_egress_name
    }
  }
  resource "aws_security_group" "sg_rds"{
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.allow_web.id}"]
    }
    egress {
        description = "allow all outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
      Name = "sg-rds-cristi"
    }
}
   #"${element(data.aws_availability_zones.available_az.names, 0)}"

# data "aws_availability_zones" "available_az" {
#   filter{
    
#   }
# }
# data "aws_ci" "available_az" {
#   filter{
    
#   }
# }


  