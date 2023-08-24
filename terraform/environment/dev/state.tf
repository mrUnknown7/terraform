terraform {
  backend "s3" {
    bucket = "jenkins-terraform-state-files"
    key = "terraform/dev.tfstate"
    access_key = "AKIATUETLGXC4GUOFFMY"
    secret_key = "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"
    region = "ap-south-1"
  }
}