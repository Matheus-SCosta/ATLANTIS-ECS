resource "aws_launch_configuration" "ubuntu_v3" {
  name          = "atlantis_ecs_v3"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  user_data     = file("user_data.sh")
  security_groups    = [data.aws_security_group.sg_ecs.id]
  key_name = "SNS"
}

resource "aws_launch_configuration" "ubuntu" {
  name          = "atlantis_ecs"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}