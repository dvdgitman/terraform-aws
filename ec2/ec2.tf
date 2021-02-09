variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

resource "aws_instance" "MYSQL" {
  ami                = "ami-0a91cd140a1fc148a"
  instance_type      = "t2.micro"

  tags = {
    Name = "MYSQL"
  }
}

