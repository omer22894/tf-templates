resource "aws_lb" "main" {
  name               = "main-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.primary-public-subnet.id,aws_subnet.ha-public-subnet.id]
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "main-tg" {
  name     = "main-lb-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "main-tg-listener" {
  load_balancer_arn = aws_lb.main.arn
  port              = "8080"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main-tg.id
  }
}