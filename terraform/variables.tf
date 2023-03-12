variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ingress_cidr" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "key_pair_name" {
  type = string
}

variable "aws_instance_type" {
  type    = string
  default = "t2.micro"
}