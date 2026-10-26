resource "aws_iam_role" "olu_ha_role" {
    name = "olu-ha-role"
    assume_role_policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "olu_app_ha_s3_policy" {
    name = "olu-app-ha-s3-policy"
    role = aws_iam_role.olu_ha_role.id
    policy = <<EOF
   {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "olu_ha_instance_profile" {
    name = "olu-ha-instance-profile"
    role = aws_iam_role.olu_ha_role.name
}