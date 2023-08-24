terraform {
  backend "s3" {
    bucket = "jenkins-terraform-state-files"
    key = "terraform/dev.tfstate"
    region = "ap-south-1"
  }
}
