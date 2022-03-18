resource "aws_ecs_service" "atlantis" {
  name            = var.resource_name
  cluster         = aws_ecs_cluster.atlantis.id
  task_definition = aws_ecs_task_definition.atlantis.arn
  desired_count   = 2


  load_balancer {
    target_group_arn = aws_lb_target_group.tg_ecs.arn
    container_name   = "${var.resource_name}_container"
    container_port   = var.port_atlantis
  }

}