data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
    bucket = "b50-tf-state-bucket"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"

    }
}