resource "aws_launch_configuration" "amazon_linux" {
  name                 = "atlantis_ecs_amazon_linux"
  image_id             = data.aws_ami.amazon_linux.id
  instance_type        = "t2.micro"
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=atlantis >> /etc/ecs/ecs.config"
  security_groups      = [data.aws_security_group.sg_ecs.id]
  key_name             = "SNS"
  iam_instance_profile = "ecsInstanceRole"
}


