resource "aws_launch_configuration" "ubuntu" {
  name          = "atlantis_ecs"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  user_data     = "#!/bin/bash\necho ECS_CLUSTER=atlantis >> /etc/ecs/ecs.config"

}