terraform {
  backend "s3" {
    bucket  = "terraform-state-anuraggupta"
    key     = "cn-web/terraform.tfstate"
    region  = "us-east-1"
    use_lockfile = true
    # dynamodb_table = "terraform-locks"
    encrypt = true
  }
}
 