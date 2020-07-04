provider "aws" {
  region                  = "us-west-1"
  shared_credentials_file = "~/.aws/config"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket = "terraform-statefile-karthi"
    key = "TERRAFORM/terraform.tfstate"
    region = "us-west-1"
  }
}

module "vpc" {
  source       = "git@github.com:karthikinnik/TERRAFORM_MODULES.git"
  vpc_cidr     = "10.160.0.0/17"
  public_cidr  = "10.160.1.0/24"
  private_cidr = "10.160.2.0/24"
  customer_name = "Test"
  public_ingress_ports = [22,80]
}
