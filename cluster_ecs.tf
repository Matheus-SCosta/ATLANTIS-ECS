#resource "aws_ecs_cluster" "atlantis" {
#  name = "atlantis"

#  setting {
#    name  = "containerInsights"
#    value = "enabled"
#  }
#}


#resource "aws_ecs_capacity_provider" "asg_atlantis" {
#  name = "example"

#  auto_scaling_group_provider {
#    auto_scaling_group_arn = aws_autoscaling_group.atlantis_ecs.arn
#  }
#}