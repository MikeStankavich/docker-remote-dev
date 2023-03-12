# todo: if create_network:
#module "aws_network" {
#  source          = "./aws/network"
#  ingress_cidr       = var.ingress_cidr
#  vpc_cidr        = local.vpc_cidr
#  security_groups = local.security_groups
#}


module "aws_ec2" {
  source        = "./aws/ec2"
  vpc_cidr      = var.vpc_cidr
  subnet_cidr   = var.subnet_cidr
  ingress_cidr  = var.ingress_cidr
  key_pair_name = var.key_pair_name
}