resource "aws_s3_bucket" "example" {
  bucket = "jenkins-terraform-bucket"

  tags = {
    Name        = "jenkins-terrafoem-bucket"
    Environment = "dev"
  }
}