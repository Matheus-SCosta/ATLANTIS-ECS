resource "aws_ecs_cluster" "atlantis" {
  name               = "atlantis"
  capacity_providers = [aws_ecs_capacity_provider.asg_atlantis.name]

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}


resource "aws_ecs_capacity_provider" "asg_atlantis" {
  name = "capacity_asg_atlantis"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.atlantis_ecs.arn
  }
}