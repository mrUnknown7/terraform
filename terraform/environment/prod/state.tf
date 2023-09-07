terraform {
  backend "s3" {
    bucket = "jenkins-terraform-state-files"
    key = "terraform/prod.tfstate"
    region = "ap-south-1"
  }
}