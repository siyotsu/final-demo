terraform {
  source = "../../../modules//codebuild"
}

include {
  path = find_in_parent_folders()
}

locals {
  secrets = read_terragrunt_config(find_in_parent_folders("secrets.hcl"))
}

dependency "ecr" {
  config_path = "../ecr"
  skip_outputs = true
}

dependency "cluster" {
  config_path = "../cluster"
  mock_outputs = {
    vpc_id          = "vpc-000000000000"
    private_subnet_ids = ["subnet-00000000000", "subnet-111111111111"]
  }
}

inputs = merge(
  local.secrets.inputs,
  {
    vpc_id = dependency.cluster.outputs.vpc_id
    // subnets = dependency.cluster.outputs.subnets
    // public_subnet_ids = dependency.cluster.outputs.public_subnet_ids
    private_subnet_ids = dependency.cluster.outputs.private_subnet_ids
    build_spec_file = "environment/dev/buildspec.yml"
  }
)
