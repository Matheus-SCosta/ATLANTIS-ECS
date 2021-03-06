resource "aws_ecs_task_definition" "atlantis" {
  family = var.resource_name
  container_definitions = jsonencode([
    {
      name      = "atlantis_container"
      image     = "398963803929.dkr.ecr.us-east-2.amazonaws.com/atlantis:2.0"
      cpu       = 128
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = var.port_atlantis
        }
      ]
    }
  ])
}

