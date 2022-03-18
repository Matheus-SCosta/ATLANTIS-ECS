resource "aws_autoscaling_group" "atlantis_ecs" {
  name                      = "${var.resource_name}_ecs"
  max_size                  = 2
  min_size                  = 2
  health_check_grace_period = 1
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.amazon_linux.name
  vpc_zone_identifier       = var.subnets_lb

  tag {
    key                 = "Name"
    value               = "ECS-HOST-ATLANTIS"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

}



#resource "aws_autoscaling_attachment" "asg_attachment_atlantis" {
#  autoscaling_group_name = aws_autoscaling_group.atlantis_ecs.id
#  alb_target_group_arn   = aws_lb_target_group.tg_ecs.arn
#}