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












## Notes

* Default AMI ID used: `ami-042e8287309f5df03` (Ubuntu 20.04 LTS in `us-east-1`). Replace with your region’s AMI if needed.
* No VPC/subnet/IGW created—uses default AWS resources.



