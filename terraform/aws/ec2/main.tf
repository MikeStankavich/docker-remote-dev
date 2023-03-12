# Get Availability Zones
#resource "tls_private_key" "key" {
#  algorithm = "RSA"
#  rsa_bits  = 4096
#}
#
## Generate a Private Key and encode it as PEM.
#resource "aws_key_pair" "key_pair" {
#  key_name   = "key"
#  public_key = tls_private_key.key.public_key_openssh
#
#  provisioner "local-exec" {
#    command = "echo '${tls_private_key.key.private_key_pem}' > ./key.pem"
#  }
#}

# Create Security Groups
resource "aws_security_group" "sg" {
  for_each    = local.security_groups
  name        = each.value.name
  description = each.value.description
  vpc_id      = data.aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = each.value.ingress

    content {
      from_port   = ingress.value.from
      to_port     = ingress.value.to
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Ubuntu
#
#Free tier eligible
#Verified provider
#Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
#ami-0557a15b87f6559cf (64-bit (x86)) / ami-0f9bd9098aca2d42b (64-bit (Arm))
#Ubuntu Server 22.04 LTS (HVM),EBS General Purpose (SSD) Volume Type. Support available from Canonical (http://www.ubuntu.com/cloud/services).
#
#Platform: ubuntu
#Root device type: ebs
#Virtualization: hvm

# Create a EC2 Instance (Ubuntu 22)
resource "aws_instance" "node" {
  instance_type          = "t3.large" # free instance
  # ami                    = "ami-0557a15b87f6559cf"  # jammy amd64
  ami                    = data.aws_ami.ubuntu_latest.id
  key_name               = data.aws_key_pair.my_key.key_name
  vpc_security_group_ids = [for sg in aws_security_group.sg : sg.id]
  subnet_id              = data.aws_subnet.my_subnet.id

  tags = {
    Name = "Docker Remote Dev host"
  }

  user_data = file("${path.module}/userdata.tpl")

  root_block_device {
    volume_size = 20
  }
}

# Create and assosiate an Elastic IP
resource "aws_eip" "eip" {
  instance = aws_instance.node.id
}
