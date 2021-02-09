# use aws internet gateway as variable
variable "aws_internet_gateway" {
  type = string
}

# create new VPC
resource "aws_vpc" "NewVpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "NewVPC"
  }
}

# output VPC ID as variable
output "vpc_id" {
  value = aws_vpc.NewVpc.id
}

# Create a Private Subnet
resource "aws_subnet" "TerraPrv" {
  vpc_id     = aws_vpc.NewVpc.id
  availability_zone = "us-east-2b"
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "TerraPrv"
  }
}
# output private subnet to use as variable
output aws_subnet {
  value = aws_subnet.TerraPrv
}

# Create a Public Subnet
resource "aws_subnet" "TerraPub" {
  vpc_id     = aws_vpc.NewVpc.id
  availability_zone = "us-east-2b"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "TerraPub"
  }
}
# output public subnet to use as variable
output aws_public {
  value = aws_subnet.TerraPub
}



