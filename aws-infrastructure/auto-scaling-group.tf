resource "aws_autoscaling_group" "webserver_auto_scaling_group" {
    name = "autoscaling"
    min_size = 1
    max_size = 4
    desired_capacity = 2

    launch_template {
      id = aws_launch_template.webserver_launch_template.id
      version = "$Default"
    }

    vpc_zone_identifier = [aws_subnet.auto_scaling_subnet_1a.id, aws_subnet.auto_scaling_subnet_1b.id]
    target_group_arns = [ aws_lb_target_group.webservers_tg.arn ]
    health_check_type = "EC2"
    health_check_grace_period = 300
}


# Weekday morning: 06:00 IST -> 00:30 UTC (Mon-Fri)
resource "aws_autoscaling_schedule" "weekday_day" {
  scheduled_action_name  = "weekday-day"
  autoscaling_group_name = aws_autoscaling_group.webserver_auto_scaling_group.name
  recurrence             = "30 0 * * MON-FRI"
  min_size               = 1
  desired_capacity       = 1
  max_size               = 4
}

# Weekday evening: 18:00 IST -> 12:30 UTC (Mon-Thu)
resource "aws_autoscaling_schedule" "weekday_night" {
  scheduled_action_name  = "weekday-night"
  autoscaling_group_name = aws_autoscaling_group.webserver_auto_scaling_group.name
  recurrence             = "30 12 * * MON-THU"
  min_size               = 1
  desired_capacity       = 2
  max_size               = 4
}

# Weekend start: 18:00 Fri IST -> 12:30 UTC Fri
resource "aws_autoscaling_schedule" "weekend_start" {
  scheduled_action_name  = "weekend-start"
  autoscaling_group_name = aws_autoscaling_group.webserver_auto_scaling_group.name
  recurrence             = "30 12 * * FRI"
  min_size               = 4
  desired_capacity       = 4
  max_size               = 4
}

# Weekend end: 06:00 Mon IST -> 00:30 UTC Mon (return to weekday-day at monday 06:00)
resource "aws_autoscaling_schedule" "weekend_end" {
  scheduled_action_name  = "weekend-end"
  autoscaling_group_name = aws_autoscaling_group.webserver_auto_scaling_group.name
  recurrence             = "30 0 * * MON"
  min_size               = 1
  desired_capacity       = 1
  max_size               = 4
}
