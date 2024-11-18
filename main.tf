terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}




# VPC Module
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnets = {
    "subnet1" = "10.0.1.0/24"
    "subnet2" = "10.0.3.0/24"
  }
  private_subnets = {
    "subnet1" = "10.0.2.0/24"
    "subnet2" = "10.0.4.0/24"
  }
}

# Logging Module
module "s3_logging" {
  source = "./modules/logging/s3_logging"

 

  bucket_name                        = "my-logging-buck-tf-security-lab"
  force_destroy                      = true
  environment                        = "prod"
  kms_master_key_id                  = "arn:aws:kms:us-east-1:123456789012:key/example-key-id"
  sse_algorithm                      = "aws:kms"
  noncurrent_version_expiration_days = 60
  block_public_acls                  = true
  block_public_policy                = true
  ignore_public_acls                 = true
  restrict_public_buckets            = true
}


# Security Services Module
module "security_services" {
  source          = "./modules/security-services"
  region          = var.region
  member_accounts = var.member_accounts
}

# EC2 Dashboard Module
module "ec2_dashboard" {
  source            = "./modules/ec2-dashboard"
  vpc_id            = module.vpc.vpc_id
  subnet_id         = element(module.vpc.public_subnets, 0)
  key_pair_name     = aws_key_pair.dashboard_key.key_name # Pass the key name here
  ami_id            = data.aws_ami.latest_amazon_linux.id
  instance_type     = var.instance_type
  security_group_id = module.vpc.dashboard_sg_id
}






data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # AWS-owned AMIs
}

#
#resource "tls_private_key" "rsa" {
#  algorithm = "RSA"
#  rsa_bits  = 4096
#}

#resource "aws_key_pair" "dashboard_key" {
#  key_name   = "dashboard-key"
#  public_key = tls_private_key.rsa.public_key_openssh
#}
