# Get Availability Zones
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"
}
