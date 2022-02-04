terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.5"

   backend "s3" {
    bucket         = "terraform-backend-11670"
    key            = "tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
    # role_arn       = "arn:aws:iam::<AWS_ACCOUNT_ID_OF_BACKEND>:role/terraform-backend"
  }
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_vpc" "example" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    
    tags = {
        Name = "Example"
    }
}