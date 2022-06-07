#...................INSTANCE....................
resource "aws_instance" "ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id = var.ec2_public_subnet
  
  
  key_name = var.ec2_key_name
  
  
  security_groups = [var.ec2_ec2_sg]
  user_data       = data.template_file.user_data.rendered
  
  
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = var.ec2_ec2_name
  }
 // depends_on = [aws_db_instance.DB]# # this will stop creating EC2 before RDS is provisioned
}#ec2 all prerequisites
# This file holds some variables that will be used to connect the wordpress website to the databaseinstance
# All o the variables that come with this tpl will be knwn ONLY AFTER the database is provisioned, therefore, this module will depend on the database module (rds-submodule)
data "template_file" "user_data" {
  template = file("./user_data.tpl")
  vars = {
    db_username      = var.database_user
    db_user_password = var.database_password
    db_name          = var.database_name
    db_RDS           = var.database_endpoint
  }
}

# creating an Elastic IP for EC2
resource "aws_eip" "eip" {
  instance = aws_instance.ec2.id

}
# resource "null_resource" "Wordpress_Installation_Waiting" {
#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file(var.PRIVATE_KEY_PATH)
#     host        = aws_eip.eip.public_ip
#   }
#   provisioner "remote-exec" {
#     inline = ["sudo tail -f -n0 /var/log/cloud-init-output.log| grep -q 'WordPress Installed'"]

#   }
# }

// creating a Load Balancer
resource "aws_alb" "alb_wordpress"{
    name               = "wordpress-alb-cristi"
    load_balancer_type =  var.ec2_load_balancer_type
    subnets            =  var.ec2_public[*]
    internal           = false
}
resource "aws_alb_target_group" "targetgroup" {
  port     = "80"
  protocol = "HTTP"
  vpc_id   =  var.ec2_vpc_id

  health_check {
    healthy_threshold   = var.ec2_healthy_threshold
    unhealthy_threshold = var.ec2_unhealthy_threshold
    timeout             = var.ec2_timeout
    interval            = var.ec2_interval
    path                = "/health.html"
    port                = "80"
  }
}
    