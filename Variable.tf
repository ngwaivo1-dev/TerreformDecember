###############################################
# AWS Region
###############################################
variable "aws_region" {
  type        = string
  default     = "eu-central-1"
  description = "AWS region"
}
###############################################
# Project Name (Tag)
###############################################
variable "project_name" {
  type        = string
  default     = "terraform-ec2-default"
  description = "Name tag for EC2 instance"
}
###############################################
# AMI ID
###############################################
variable "ami_id" {
  type        = string
  description = "AMI to use for the EC2 instance"
  default     = "ami-015f3aa67b494b27e"
}
###############################################
# Instance Type
###############################################
variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type"
}
###############################################
# Existing Key Pair Name
###############################################
variable "keypair_name" {
  type        = string
  description = "Name of an existing EC2 key pair"
  default     = "deckey"  # replace with your real key pair
}