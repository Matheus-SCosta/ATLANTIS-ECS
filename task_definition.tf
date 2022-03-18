resource "aws_ecs_task_definition" "atlantis" {
  family = "atlantis"
  container_definitions = jsonencode([
    {
      name      = "atlantis_container"
      image     = "398963803929.dkr.ecr.us-east-2.amazonaws.com/atlantis:2.0"
      cpu       = 128
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 4141
        }
      ]
    }
  ])
}

resource "aws_ecs_task_set" "atlantis" {
  service         = aws_ecs_service.atlantis.id
  cluster         = aws_ecs_cluster.atlantis.id
  task_definition = aws_ecs_task_definition.atlantis.arn

  load_balancer {
    target_group_arn = aws_lb_target_group.tg_ecs.arn
    container_name   = "atlantis_container"
    container_port   = 4141
  }
}