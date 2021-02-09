variable "vpc_id" {
  type = string
}

output "security_group_id" {
       value = aws_security_group.terraform.id
}


resource "aws_security_group" "terraform" {
  name        = "MySQL"
  description = "Allow MSQL inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "port 443 for HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 3306 for MYSQL "
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "port 22 for SSH "
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform"
  }
}