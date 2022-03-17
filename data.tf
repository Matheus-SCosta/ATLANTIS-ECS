data "aws_security_group" "sg_ecs" {
  name = "instance-sg-1"
}

data "aws_vpc" "vpc_default" {
  cidr_block = "172.31.0.0/16"
}

#data "aws_ami" "ubuntu" {
#  most_recent = true
#  owners      = ["self"]
#  filter {
#    name   = "name"
#    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#  }
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#}  