# Create a VPC
output "vpc_id" {
  value = aws_vpc.NewVpc.id
}

resource "aws_vpc" "NewVpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "NewVPC"
  }
}

# Create a Private Subnet
resource "aws_subnet" "TerraPrv" {
  vpc_id     = aws_vpc.NewVpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "TerraPrv"
  }
}
# Create a Public Subnet
resource "aws_subnet" "TerraPub" {
  vpc_id     = aws_vpc.NewVpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "TerraPub"
  }
}



