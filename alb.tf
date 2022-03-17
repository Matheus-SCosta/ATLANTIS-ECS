resource "aws_lb" "lb_ecs" {
  name               = "lb-ecs"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.sg_lb
  subnets            = var.subnets_lb

  enable_deletion_protection = true

  tags = {

    Environment = "teste"
  }
}