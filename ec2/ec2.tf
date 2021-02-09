variable "aws_subnet" {
  type = string
}

variable "aws_public" {
  type = string
}

variable "security_group_id" {
  type = string
}

resource "aws_instance" "MYSQL" {
  ami                    = "ami-0a91cd140a1fc148a"
  instance_type          = "t2.micro"
  subnet_id              = var.aws_subnet
  vpc_security_group_ids = [var.security_group_id]
  key_name = "terraform"

  tags = {
    Name = "MYSQL"
  }
}

resource "aws_instance" "NGINX" {
  ami                    = "ami-0a91cd140a1fc148a"
  instance_type          = "t2.micro"
  subnet_id              = var.aws_public
  vpc_security_group_ids = [var.security_group_id]
  key_name = "terraform"

  tags = {
    Name = "NGINX"
  }
}
