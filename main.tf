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
  security_groups = [aws_security_group.security-group-1.name]

  tags = {
    Name = "my_ec2_instance_1"
  }
}

resource "aws_instance" "instance2" {
  ami           = "ami-09538e4f51a14fa76"
  instance_type = "t2.micro"
  key_name      = "my_key_pair"
  security_groups = [aws_security_group.security-group-2.name]

  tags = {
    Name = "my_ec2_instance_2"
  }
}

resource "aws_security_group" "security-group-1" {
    #arn         = "arn:aws:ec2:us-east-1:682734345237:security-group/sg-0d7e7cf82a6fd679b"
    description = "Allow SSH Access"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    #id          = "sg-0d7e7cf82a6fd679b"
    ingress     = [
        {
            cidr_blocks      = [
                "98.23.37.175/32",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ]
    name        = "security-group-instance-1"
    #owner_id    = "682734345237"
    tags        = {}
    tags_all    = {}
    vpc_id      = var.vpc_id #"vpc-7df65200"

    timeouts {}
}

resource "aws_security_group" "security-group-2" {
    #arn         = "arn:aws:ec2:us-east-1:682734345237:security-group/sg-0facef142d55f9135"
    description = "Allow SSH Access"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    #id          = "sg-0facef142d55f9135"
    ingress     = [
        {
            cidr_blocks      = []
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                aws_security_group.security-group-1.id,
            ]
            self             = false
            to_port          = 22
        },
    ]
    name        = "security-group-2"
    #owner_id    = "682734345237"
    tags        = {}
    tags_all    = {}
    vpc_id      = var.vpc_id #"vpc-7df65200"

    timeouts {}
}
