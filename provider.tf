terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "michidevops-eks"
    key    = "states/terraform-eks.tfstate"
    region = "us-east-1"
  }
}