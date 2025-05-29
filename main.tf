provider "aws" {
  region = "us-west-1" 
}

resource "aws_instance" "nginx_server" {
  ami                    = "ami-04f7a54071e74f488" 
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y nginx
              echo "Welcome to the Terraform-managed Nginx Server on Ubuntu" | sudo tee /var/www/html/index.html
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  tags = {
    Name = "TerraformNginxServer"
  }
}

resource "aws_security_group" "nginx_sg" {
  name        = "nginx_sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "default" {
  default = true
}
