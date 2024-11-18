# EC2 Instance
resource "aws_instance" "dashboard" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name # Reference the key pair passed as a variable
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable python3.8
              yum install -y python3.8
              pip3 install flask boto3
              echo "<h1>Welcome to the Flask Dashboard</h1>" > /var/www/html/index.html
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = "EC2-Dashboard"
  }
}

# Security Group for the EC2 Instance
resource "aws_security_group" "dashboard_sg" {
  name        = "dashboard-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Dashboard-Security-Group"
  }
}


