resource "aws_launch_configuration" "ubuntu_v3" {
  name          = "atlantis_ecs_v3"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  user_data     = "#!/bin/bash\necho ECS_CLUSTER=my-cluster >> /etc/ecs/ecs.config"
  security_groups    = [data.aws_security_group.sg_ecs.id]
  key_name = "SNS"
}

