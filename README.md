# EC2 Nginx Deployment with Terraform

This project provisions an AWS EC2 instance running , installs Nginx, and serves a custom welcome page.

## Prerequisites

* AWS account with IAM credentials
* Terraform CLI installed
* AWS CLI installed (optional)
* Existing AWS key pair (optional if you plan to SSH)

## Expected File Structure  

├── main.tf  
├── variables.tf  
├── outputs.tf  
├── README.md  

## main.tf
provider "aws" {  
  region = "us-east-1" # Change to your desired AWS region  
}  

resource "aws_instance" "nginx_server" {  
  ami                    = "ami-042e8287309f5df03" # Ubuntu 20.04 LTS in us-east-1  
  instance_type          = var.instance_type  
  key_name               = var.key_name           # Optional: Provide your existing key pair name  
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]  

  user_data =  
              #!/bin/bash  
              sudo apt update  
              sudo apt install -y nginx  
              echo "Welcome to the Terraform-managed Nginx Server on Ubuntu" | sudo tee /var/www/html/index.html    
              sudo systemctl enable nginx   
              sudo systemctl start nginx    
                

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

## Variables.tf  

variable "instance_type" {  
  description = "EC2 instance type"  
  default     = "t2.micro"  
}  

variable "key_name" {  
  description = "EC2 key pair name"  
  default     = "" # Leave empty if you don't want to SSH  
}  

## Output.tf  

output "instance_public_ip" {  
  description = "Public IP of the EC2 instance"  
  value       = aws_instance.nginx_server.public_ip  
}  


## Steps to Deploy

1️⃣ **Initialize Terraform**

```bash
terraform init
```

2️⃣ **Plan the deployment**

```bash
terraform plan
```

3️⃣ **Apply the configuration**

```bash
terraform apply
```

4️⃣ **Output the public IP**
Terraform will output the public IP of the instance. Access it via `http://<public-ip>`.

## Destroy the deployment

```bash
terraform destroy
```

## Screenshots  

![image](https://github.com/user-attachments/assets/1d77a258-97d8-486d-af27-045dc49f69f8)  

![image](https://github.com/user-attachments/assets/b837ea5b-1abe-4f03-9358-107c18f55013)   

![image](https://github.com/user-attachments/assets/bc4b8783-3aec-4923-88af-87047cc6ddbc)    

![image](https://github.com/user-attachments/assets/9ac37771-2612-4044-b1c2-02d50fd0c8dd)   

![image](https://github.com/user-attachments/assets/f442da0a-a030-498d-abf6-7ea0816b76a6)  















