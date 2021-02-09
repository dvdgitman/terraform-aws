#using aws private,public and security group ID as variables
variable "aws_subnet" {
  type = string
}
variable "aws_public" {
  type = string
}
variable "security_group_id" {
  type = string
}
#create aws ec2 instance named MYSQL with private subnet
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
#create aws ec2 instance named NGINX with public subnet
resource "aws_instance" "NGINX" {
  ami                    = "ami-0a91cd140a1fc148a"
  instance_type          = "t2.micro"
  subnet_id              = var.aws_public
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  key_name = "terraform"

  tags = {
    Name = "NGINX"
  }

  connection {
    type        = "ssh"
    host        = aws_instance.NGINX.public_ip
    user        = "ubuntu"
    private_key = file("terraform.pem")
  }



}


