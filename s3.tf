resource "aws_s3_bucket" "example_bucket" {
  bucket = "theaterplays-dev"

  tags = local.common_tags
}