terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.7"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"
}

module "webserver" {
  source     = "./modules/ec2"
  servername = "terraformdemo"
  size       = "t3.micro"
}

output "public_ip" {
  value = module.webserver.public_ip
}
