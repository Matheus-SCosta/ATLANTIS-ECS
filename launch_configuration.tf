resource "aws_launch_configuration" "ubuntu_v2" {
  name          = "atlantis_ecs_v2"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  user_data     = file("user_data.sh")
  security_groups    = [data.aws_security_group.sg_ecs.id]

}