terraform {

  required_version = ">= 1.5.0"



  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "~> 6.0"

    }

  }

}



provider "aws" {

  region = var.aws_region

}



resource "aws_key_pair" "deployer" {

  key_name = "${var.project_name}-key"

  public_key = file(pathexpand(var.public_key_path))



  tags = {

    Name = "${var.project_name}-key"

    Project = var.project_name

  }

}



resource "aws_security_group" "web" {

  name = "${var.project_name}-security-group"

  description = "Allow HTTP and temporary SSH access for the DevOps assignment"

  vpc_id = var.vpc_id



  ingress {

    description = "Temporary SSH access for configuration management"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



  ingress {

    description = "Public HTTP access to the static website"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }



  egress {

    description = "Allow outbound access for package installation"

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }



  tags = {

    Name = "${var.project_name}-security-group"

    Project = var.project_name

  }

}



resource "aws_instance" "web" {

  ami = var.ami_id

  instance_type = var.instance_type

  key_name = aws_key_pair.deployer.key_name

  subnet_id = var.subnet_id

  vpc_security_group_ids = [aws_security_group.web.id]

  associate_public_ip_address = true



  tags = {

    Name = var.project_name

    Project = var.project_name

  }

}



resource "aws_route_table" "public" {

  vpc_id = var.vpc_id



  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = var.internet_gateway_id

  }



  tags = {

    Name = "${var.project_name}-public-route-table"

    Project = var.project_name

  }

}



resource "aws_route_table_association" "public_subnet" {

  subnet_id = var.subnet_id

  route_table_id = aws_route_table.public.id

}

 