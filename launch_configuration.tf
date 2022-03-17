resource "aws_launch_configuration" "ubuntu_20_04" {
  name          = "atlantis_ecs"
  image_id      = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
}