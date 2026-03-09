terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.30.0"
    }
  }
}

module "Enclave" {
  source              = "../../Modules/vpc"
  VPC-CIDR            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}

module "security" {
  source = "../../Modules/security"
  vpc_id = module.Enclave.vpc_id
}

module "compute" {
  source    = "../../Modules/compute"
  subnet_id = module.Enclave.public_subnet_id
  sg_id     = module.security.web_server_sg_id
}

