###############################################
# Terraform Cloud Backend
###############################################
terraform {
  cloud {
    organization = "GLOBALPRIME"
    workspaces {
      name = "TerreformDecember"
    }
  }
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}
###############################################
# Get Default VPC and Subnets
###############################################
data "aws_vpc" "default" {
  default = true
}
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
###############################################
# Get Default Security Group
###############################################
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}
###############################################
# EC2 Instance using default resources
###############################################
resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(data.aws_subnets.default.ids, 0)
  vpc_security_group_ids = [data.aws_security_group.default.id]
  key_name = var.keypair_name   # existing EC2 key pair
  tags = {
    Name = var.project_name
  }
}