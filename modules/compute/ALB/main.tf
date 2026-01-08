resource "aws_lb" "name" {
    name               = "${var.tags["Name"]}-alb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = var.security_group_ids
    subnets            = var.subnet_ids
    tags = merge(var.tags, { Name = "${var.tags["Name"]}-alb" })
}

resource "aws_lb_listener" "name" {
    load_balancer_arn = aws_lb.name.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.name.arn

        fixed_response {
            content_type = "text/plain"
            message_body = "Hello, World!"
            status_code  = "200"
        }
    }
}

resource "aws_lb_target_group" "name" {
    name     = "${var.tags["Name"]}-tg"
    port     = 80
    protocol = "HTTP"
    vpc_id   = var.vpc_id

    health_check {
        path                = "/"
        interval            = 30
        timeout             = 5
        healthy_threshold  = 2
        unhealthy_threshold = 2
    }

    tags = merge(var.tags, { Name = "${var.tags["Name"]}-tg" })
}
resource "aws_lb_target_group_attachment" "name" {
    count = length(var.instance_ids)
    target_group_arn = aws_lb_target_group.name.arn
    target_id        = var.instance_ids[count.index]
    port             = 80
}