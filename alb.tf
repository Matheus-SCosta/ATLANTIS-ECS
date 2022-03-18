locals {
    protocol = "HTTP"
}

resource "aws_lb_target_group" "tg_ecs" {
  name     = "tg-ecs"
  port     = var.port_atlantis
  protocol = local.protocol
  vpc_id   = data.aws_vpc.vpc_default.id
}


resource "aws_lb" "lb_ecs" {
  name               = "lb-ecs"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.sg_ecs.id]
  subnets            = var.subnets_lb

  enable_deletion_protection = true

  tags = {
    Environment = "teste"
  }
}

resource "aws_lb_listener" "tg_ecs_listener" {
  load_balancer_arn = aws_lb.lb_ecs.arn
  port              = "80"
  protocol          = local.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_ecs.arn
  }
}