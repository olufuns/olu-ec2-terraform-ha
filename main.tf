resource "aws_launch_template" "olu_ha_lt" {
    name_prefix   = "olu-ha-lt-"
    image_id      = var.ami
    instance_type = var.instance_type
    key_name     = var.key_name

    network_interfaces {
        associate_public_ip_address = true
        security_groups             = [aws_security_group.olu_app_ha_sg.id]
    }
    
    user_data = filebase64("userdata.sh")
     iam_instance_profile {
        name = aws_iam_instance_profile.olu_ha_instance_profile.name
    }
  
}

resource "aws_autoscaling_group" "olu_ha_asg" {
    desired_capacity     = 3
    max_size             = 6
    min_size             = 3
    vpc_zone_identifier  = var.subnet_ids
    launch_template {
        id      = aws_launch_template.olu_ha_lt.id
        version = "$Latest"
    }
}