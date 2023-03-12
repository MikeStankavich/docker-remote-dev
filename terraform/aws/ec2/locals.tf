locals {
  security_groups = {
    public = {
      name        = "docker_remote_dev_sg"
      description = "Security group for Public Access"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = [var.ingress_cidr]
        }
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = [var.ingress_cidr]
        }
        https = {
          from        = 443
          to          = 443
          protocol    = "tcp"
          cidr_blocks = [var.ingress_cidr]
        }
      }
    }
  }
}
