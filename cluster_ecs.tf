resource "aws_ecs_cluster" "atlantis" {
  name = "atlantis"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}