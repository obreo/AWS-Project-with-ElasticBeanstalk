# AWS CSP Configuration

# Provider's Lib
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Provider's Config

provider "aws" {
  shared_credentials_file = "/Users/USERNAME/.aws/credentials"
  profile                 = "default"   #username
  region                  = "eu-west-2" #London
}