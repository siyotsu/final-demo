locals {
  remote_state_bucket_prefix = "terra"
  environment = "dev"
  app_name = "app"
  aws_profile = "default"
  aws_account = "174462142093"
  aws_region = "us-east-1"
  image_tag = "v0.1"
  repo_url = "https://github.com/teslaluv/final-demo"
  branch_pattern = "^refs/heads/development$"
  git_trigger_event = "PUSH"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidrs = [
     "10.0.1.0/24",
     "10.0.2.0/24"
   ]
  // private_subnet_cidrs = []
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.22.0/24"]
}

inputs = {
  remote_state_bucket = format("%s-%s-%s-%s", local.remote_state_bucket_prefix, local.app_name, local.environment, local.aws_region)
  environment = local.environment
  app_name = local.app_name
  aws_profile = local.aws_profile
  aws_account = local.aws_account
  aws_region = local.aws_region
  image_tag = local.image_tag
  repo_url = local.repo_url
  branch_pattern = local.branch_pattern
  git_trigger_event = local.git_trigger_event
  vpc_cidr = local.vpc_cidr
  public_subnet_cidrs = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
}

remote_state {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = format("%s-%s-%s-%s", local.remote_state_bucket_prefix, local.app_name, local.environment, local.aws_region)
    key            = format("%s/terraform.tfstate", path_relative_to_include())
    region         = local.aws_region
    dynamodb_table = format("tflock-%s-%s-%s", local.environment, local.app_name, local.aws_region)
    profile        = local.aws_profile
  }
}

# Version Locking
## tfenv exists to help developer experience for those who use tfenv
## it will automatically download and use this terraform version

generate "tfenv" {
  path              = ".terraform-version"
  if_exists         = "overwrite"
  disable_signature = true

  contents = <<EOF
0.14.7
EOF
}

terraform_version_constraint = "0.14.7"

terragrunt_version_constraint = ">= 0.26.7"

terraform {
  after_hook "remove_lock" {
    commands = [
      "apply",
      "console",
      "destroy",
      "import",
      "init",
      "plan",
      "push",
      "refresh",
    ]

    execute = [
      "rm",
      "-f",
      "${get_terragrunt_dir()}/.terraform.lock.hcl",
    ]

    run_on_error = true
  }
}
