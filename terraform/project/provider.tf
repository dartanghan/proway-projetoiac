provider "aws" {
    region = var.project_region
}

terraform {
  backend "s3" {
    bucket = "" 
    key    = "project.tfstate"
    region = ""
  }
}