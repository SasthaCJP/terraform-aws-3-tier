# Terraform AWS 3-Tier Architecture

This repository contains the Terraform code for provisioning a 3-tier architecture on AWS. The architecture consists of a:

- **Web Tier (EC2 instances)**: Hosted in public subnets, running a PHP application.
- **Application Tier (EC2 instances)**: Hosted in private subnets, running an application backend.
- **Database Tier (RDS)**: Hosted in private subnets, running MySQL.

This project uses Terraform to automate the provisioning of resources such as VPC, subnets, EC2 instances, RDS instances, load balancers, security groups, and more, in a scalable and modular fashion.

## Architecture Overview

The infrastructure is designed with the following components:

1. **VPC**: A custom Virtual Private Cloud (VPC) with public and private subnets across multiple availability zones.
2. **Security Groups**: Separate security groups for the Jump Server, PHP App Servers, ALB, and RDS.
3. **EC2 Instances**: Web and Application servers configured within the VPC.
4. **RDS Instance**: MySQL database hosted in private subnets.
5. **ALB**: An Application Load Balancer to distribute traffic to web servers.

## Requirements

Before you begin, ensure that you have the following tools installed:

- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with appropriate credentials)

## Getting Started

Follow the steps below to deploy the infrastructure using Terraform.

### 1. Clone the repository

```bash
git clone https://github.com/SasthaCJP/terraform-aws-3-tier.git
cd terraform-aws-3-tier
