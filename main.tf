provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_key_pair" "my_key_pair" {
  key_name = "my_key_pair"
  #public_key = var.ssh_public_key
  public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
}

resource "aws_instance" "instance1" {
  ami           = "ami-09538e4f51a14fa76"
  instance_type = "t2.micro"
  key_name      = "my_key_pair"

  tags = {
    Name = "my_ec2_instance_1"
  }
}

resource "aws_instance" "instance2" {
  ami           = "ami-09538e4f51a14fa76"
  instance_type = "t2.micro"
  key_name      = "my_key_pair"

  tags = {
    Name = "my_ec2_instance_2"
  }
}