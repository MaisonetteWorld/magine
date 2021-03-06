provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraformer-remote-states-use1"
    key    = "apps/magine/prd.tfstate"
    region = "us-east-1"
  }
}

module "magine" {
  source = "../../modules/magine"

  region        = "us-east-1"
  environment   = "prd"
  assets_bucket = "maisonette-prd"
  cms_bucket    = "maisonette-cms-prd"
  memory_size   = 1280
  timeout       = 300
}
