variable "aws_region" {

  description = "AWS Region used for the assignment environment"

  type = string

  default = "us-east-1"

}



variable "instance_type" {

  description = "EC2 instance type"

  type = string

  default = "t2.micro"

}



variable "project_name" {

  description = "Project name used to identify AWS resources"

  type = string

  default = "CallumDevOpsEC2"

}



variable "public_key_path" {

  description = "Path to the public SSH key used for EC2 access"

  type = string

  default = "~/.ssh/callum-devops.pub"

}



variable "ami_id" {

  description = "Amazon Linux 2023 AMI permitted by the AWS Learner Lab in us-east-1"

  type = string

  default = "ami-0332d564d76dbd8d6"

}

variable "vpc_id" {

  description = "Existing AWS Learner Lab VPC used by the EC2 instance"

  type = string

  default = "vpc-00a2c3b6cf8953c56"

}



variable "subnet_id" {

  description = "Existing AWS Learner Lab subnet used for the web server"

  type = string

  default = "subnet-0b6916d469852572b"

}



variable "internet_gateway_id" {

  description = "Existing internet gateway attached to the Learner Lab VPC"

  type = string

  default = "igw-0fef2c51261c1382b"

}

 