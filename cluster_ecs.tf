resource "aws_ecs_cluster" "atlantis" {
  name = var.resource_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}