terraform {
  backend "s3" {
    bucket = "3tier-terraform-state-bucket1"
    key    = "3tier-app/terraform.tfstate"
    region = "ap-south-1"
  }
}
