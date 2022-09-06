resource "aws_autoscaling_group" "main" {
  name                      = "main-asg"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.main.name
  vpc_zone_identifier       = [aws_subnet.primary-public-subnet.id,aws_subnet.ha-public-subnet.id]

  tag {
    key                 = "name"
    value               = "main-asg-instances"
    propagate_at_launch = false
  }

}
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.main.id
  lb_target_group_arn    = aws_lb_target_group.main-tg.arn
}
