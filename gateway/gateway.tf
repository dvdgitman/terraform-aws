#use VPC id as a variable
variable "vpc_id" {
  type = string
}
#use aws public id as a variable
variable "aws_public" {
  type = string
}
#create new internet gateway
resource "aws_internet_gateway" "test-env-gw" {
  vpc_id = var.vpc_id
  tags = {
    name = "env-gw"
  }
}
#output the aws internet gateway id to use as variable
output "aws_internet_gateway" {
  value = aws_internet_gateway.test-env-gw.id
}
#create new route table
resource "aws_route_table" "route-table-test-env" {
  vpc_id = var.vpc_id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-env-gw.id
  }
    tags = {
    Name = "test-env-route-table"
  }
}
#assign the aws public subnet to the route table
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = var.aws_public
  route_table_id = aws_route_table.route-table-test-env.id
}
