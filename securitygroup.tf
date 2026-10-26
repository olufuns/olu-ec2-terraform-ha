resource "aws_security_group" "olu_app_ha_sg" {
  name        = "olu-app-sg"
  description = "Security group for olu application"
  vpc_id      = "vpc-0ea9b12ce1c86f529"
}

resource "aws_security_group_rule" "ssh_rule" {
  security_group_id = aws_security_group.olu_app_ha_sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "http_rule" {
  security_group_id = aws_security_group.olu_app_ha_sg.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_rule" {
  security_group_id = aws_security_group.olu_app_ha_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}