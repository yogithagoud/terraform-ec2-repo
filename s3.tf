resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "my-s3-bucket"  # Change to a unique name
  acl    = "private"

  tags = {
    Name        = "TerraformStateBucket"
    Environment = "Dev"
  }
}
