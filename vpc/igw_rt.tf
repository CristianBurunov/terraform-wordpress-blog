#.......................INTERNET GATEWAY..................
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  
  tags = {
    Name = var.vpc_igw_name
  }
}
#........................ROUTE TABLE......................
resource "aws_route_table" "route_table" {
  vpc_id =  aws_vpc.vpc.id

  route {
    cidr_block = var.vpc_rt_cidr_block#"0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
      # Internet traffic for ipv6 ips routed through the igw
    ipv6_cidr_block = "::/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.vpc_rt_name
  }
}
#.................ROUTE TABLE ASSOCIATION...................
resource "aws_route_table_association" "rt_association" {
    count          = length(var.vpc_public_subnets_cidr)
    subnet_id      = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.route_table.id
  }