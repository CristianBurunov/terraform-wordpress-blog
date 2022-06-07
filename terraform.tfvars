root_region = "us-east-1"
# root_access_key = "AKIA2H7HP6WHP2QXBQPW"
# root_secret_key = "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"

root_ami           = "ami-04505e74c0741db8d"
root_ec2_name      = "Ubuntu"
root_instance_type = "t2.micro"

root_private_subnets_cidr = ["10.0.1.0/24", "10.0.3.0/24"]
root_public_subnets_cidr  = ["10.0.2.0/24", "10.0.4.0/24"]
root_az                   = ["us-east-1a", "us-east-1b"]

root_vpc_name = "VPC"
root_vpc_cidr = "10.0.0.0/16"

root_egress_ports     = "0"
root_egress_protocol  = "-1"
root_egress_name      = "allow_web_trafic"
root_ingress_protocol = "tcp"
root_ingress_ports    = [22, 80, 443, 3306]

root_sg_name        = "allow_traffic"
root_sg_description = "sg_description"

root_rt_name       = "route_table"
root_igw_name      = "internet_gateway"
root_rt_cidr_block = "0.0.0.0/0"


root_db_storage        = 10
root_db_engine         = "mysql"
root_db_engine_version = "5.7"
root_db_instance_class = "db.t3.micro"
root_db_name           = "wordpressDB"
root_db_username       = "admin"
root_db_password       = "admin1234"
root_db_subnet_group   = "db_subnet_group"
# root_db_parameter_group_name = "parameter_group_name"
root_sg_rds      = module.vpc.output_sg_rds
subnet_private_1 = module.vpc.private

root_key_name            = "key_pair_ec2"


root_load_balancer_type  = "application"
root_healthy_threshold   = 3
root_unhealthy_threshold = 10
root_timeout             = 5
root_interval            = 10

root_volume_size = 8
root_volume_type = "gp2"

# root_PUBLIC_KEY_PATH  = "./cheiepublica"
# root_PRIVATE_KEY_PATH = "./lowkey.pem"