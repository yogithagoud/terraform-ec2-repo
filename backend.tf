terraform {
  backend "s3" {
    bucket         = aws_s3_bucket.terraform_state_bucket.bucket
    key            = "terraform/statefile.tfstate"
    region         = var.region  # Ensure you have a variable for the region
  }
}
