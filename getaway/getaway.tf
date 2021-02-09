variable "vpc_id" {
  type = string
}

variable "aws_public" {
  type = string
}

resource "aws_internet_gateway" "test-env-gw" {
  vpc_id = var.vpc_id
  tags = {
    name = "env-gw"
  }
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.test-env-gw.id
}

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
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = var.aws_public
  route_table_id = aws_route_table.route-table-test-env.id
}