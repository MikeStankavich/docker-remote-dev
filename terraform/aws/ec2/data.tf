data "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}

data "aws_subnet" "my_subnet" {
  cidr_block = var.subnet_cidr
}

data "aws_key_pair" "my_key" {
  key_name = var.key_pair_name
}

data "aws_ami" "ubuntu_latest" {
  owners = ["099720109477"] # Canonical
  most_recent      = true
  #  name_regex       = "^Ubuntu Server 22.04 LTS"
  name_regex       = "^ubuntu/images/hvm-ssd/ubuntu-.*-amd64-server"
}

