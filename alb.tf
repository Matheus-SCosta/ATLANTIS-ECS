resource "aws_lb" "lb_ecs" {
  name               = "lb-ecs"
  internal           = false
  load_balancer_type = "application"
  security_groups    =  [ var.sg_lb ]
  subnets            = ["subnet-0b8ec0c0cc65e83fe","subnet-01eb577852a061ca1", "subnet-0e5e136aa686c7336"]

  enable_deletion_protection = true

  tags = {

    Environment = "teste"
  }
}