terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
  backend "s3" {
    bucket         = "olu1-demo-app"
    key            = "olu1-ha/terraform.tfstate"
    region         = "eu-west-2"
  }  
}

provider "aws" {
  region = "eu-west-2"
}