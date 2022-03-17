resource "aws_placement_group" "atlantis_ecs" {
  name     = "test"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "atlantis_ecs" {
  name                      = "atlantis_ecs"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 1
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  placement_group           = aws_placement_group.atlantis_ecs.id
  launch_configuration      = aws_launch_configuration.ubuntu_20_04.name
  vpc_zone_identifier       = var.subnets_lb

  target_group_arns = [ aws_lb_target_group.tg_ecs.arn ]

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Env"
    value               = "teste"
    propagate_at_launch = false
  }
}