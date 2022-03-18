resource "aws_launch_configuration" "ubuntu_20_04" {
  name          = "atlantis_ecs"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
}