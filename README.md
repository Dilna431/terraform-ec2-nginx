# EC2 Nginx Deployment with Terraform

This project provisions an AWS EC2 instance running , installs Nginx, and serves a custom welcome page.

## Prerequisites

* AWS account with IAM credentials
* Terraform CLI installed
* AWS CLI installed (optional)
* Existing AWS key pair (optional if you plan to SSH)

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

## 🗑️ Destroy the deployment

```bash
terraform destroy
```

## Notes

* Default AMI ID used: `ami-042e8287309f5df03` (Ubuntu 20.04 LTS in `us-east-1`). Replace with your region’s AMI if needed.
* No VPC/subnet/IGW created—uses default AWS resources.
* `key_name` variable is optional; leave empty if SSH isn’t required.


