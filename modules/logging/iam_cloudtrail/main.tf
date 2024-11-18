resource "aws_iam_role" "cloudtrail_role" {
  name = "cloudtrail-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "cloudtrail_policy" {
  name       = "cloudtrail-policy-attachment"
  roles      = [aws_iam_role.cloudtrail_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCloudTrailFullAccess"
}
