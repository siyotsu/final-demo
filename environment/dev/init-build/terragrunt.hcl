terraform {
  source = "../../../modules//init-build"
}

include {
  path = find_in_parent_folders()
}

dependency "ecr" {
  config_path = "../ecr"
  mock_outputs = {
  ecr_url = "000000000000.dkr.ecr.eu-west-1.amazonaws.com/image"
  registry_id = "000000000000"
  }
  # skip_outputs = true
}

inputs = {
  working_dir = format("%s/../../../app", get_terragrunt_dir())
  ecr_url = dependency.ecr.output.ecr_repository_url
  registry_id = dependency.ecr.output.reg_id
}
