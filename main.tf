terraform {
  required_version = "1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }
  backend "s3" {
    bucket         = "tfstate-backend-234234234234234-ecs"
    key            = "tfstate-backend.tfstate"
    region         = "us-east-2"
    profile        = "terraformKEY"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::398963803929:role/Terraform"
    session_name = "terraform_cross_account_access_role"
  }
}

