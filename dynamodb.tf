resource "aws_dynamodb_table" "theaterplays" {
  name           = "theaterplays"
  billing_mode   = "PAY_PER_REQUEST" # On-demand pricing; change to "PROVISIONED" if you want to specify throughput
  hash_key       = "PlayID"
  range_key      = "ExhibitionDate"

  attribute {
    name = "PlayID"
    type = "S"
  }

  attribute {
    name = "ExhibitionDate"
    type = "S"
  }

  attribute {
    name = "Name"
    type = "S"
  }

  # Global Secondary Index for searching by Name
  global_secondary_index {
    name               = "NameIndex"
    hash_key           = "Name"
    range_key          = "PlayID"
    projection_type    = "ALL"
    read_capacity      = 5    # Set if using provisioned capacity
    write_capacity     = 5    # Set if using provisioned capacity
  }

  # Global Secondary Index for searching by Name and Exhibition Date Range
  global_secondary_index {
    name               = "NameExhibitionDateIndex"
    hash_key           = "Name"
    range_key          = "ExhibitionDate"
    projection_type    = "ALL"
    read_capacity      = 5    # Set if using provisioned capacity
    write_capacity     = 5    # Set if using provisioned capacity
  }

  # Global Secondary Index for searching by Exhibition Date
  global_secondary_index {
    name               = "ExhibitionDateIndex"
    hash_key           = "ExhibitionDate"
    projection_type    = "ALL"
    read_capacity      = 5    # Set if using provisioned capacity
    write_capacity     = 5    # Set if using provisioned capacity
  }

  tags = local.common_tags
}
