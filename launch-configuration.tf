resource "aws_launch_configuration" "main" {
  name                    = "main-launch-configuration"
  image_id                = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  security_groups         = [aws_security_group.lb_sg.id]
}