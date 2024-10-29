variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "ap-south-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "Mumbai"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "sg-046ee8544142aee13"
}

variable "ami_id" {
  description = "AMI for Amazon Ami2 Ec2 instance"
  default     = "ami-04a37924ffe27da53"
}
