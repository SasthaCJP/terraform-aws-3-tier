# Terraform AWS 3-Tier Architecture

This project sets up a 3-tier architecture on AWS using Terraform, including the necessary resources such as VPC, subnets, security groups, EC2 instances, load balancers, and RDS for MySQL. The architecture is designed to be modular and reusable for different environments.

## Architecture Overview

The architecture includes the following components:

- **VPC**: A virtual private cloud (VPC) with public and private subnets.
- **Security Groups**: Security groups for the jump server, PHP application server, RDS instance, and load balancer.
- **EC2 Instances**: A jump server, a PHP application server, and an auto-scaling group for application servers.
- **ALB (Application Load Balancer)**: An ALB to handle HTTP requests and route them to the appropriate EC2 instances.
- **RDS Instance**: An RDS MySQL instance for storing application data.

## Project Setup

### Prerequisites

Before you start, you need to have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (v1.0 or higher)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with your AWS credentials)
- [Git](https://git-scm.com/)

### Clone the Repository

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/SasthaCJP/terraform-aws-3-tier.git
cd terraform-aws-3-tier
Configure Terraform Variables
Before running Terraform, configure the variables in the terraform.tfvars file to match your AWS environment.
region = "us-east-2"
vpc_id = "vpc-xxxxxxxx"
public_subnet_ids = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
private_db_subnet_ids = ["subnet-zzzzzzzz"]
db_username = "admin"
db_password = "your-password"
tags = {
  "Owner" = "YourName"
  "Project" = "3-Tier Architecture"
}

