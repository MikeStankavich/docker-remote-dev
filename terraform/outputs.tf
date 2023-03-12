output "public_ip" {
  value = module.aws_ec2.ec2_public_ip
}

output "public_dns" {
  value = module.aws_ec2.ec2_public_dns
}

output "public_dns" {
  value = module.aws_ec2.ec2_public_dns
}

output "key_file" {
  value = "~/.ssh/${key_pair_name}.pem"
}