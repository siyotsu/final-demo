# This project is built using Terragrunt for two environments that have an initial build, ECS, ECR, and CodeBuild.

#### Tools versions:
- AWS Cli - 1.18.69
- Terraform - 0.14.7
- Terragrunt - 0.28.7


#### Every environment has:
- 2 Public subnets
- 2 Private subnets
- Internet gateway
- 2 NAT (Network Address Translation)
- Autoscaling Group
- Application Load Balancer
- Init build
- ECR (Elastic Container Registry)
- ECS (Elastic Container Service)
- CodeBuild

### Steps to launch the project:

1. Install Terraform, Terragrunt and Git.
2. Clone this repository
```
git clone <https://github.com/teslaluv/final-demo.git>
```
3. Then you need to write your variables in local block in environment/dev/terragrunt.hcl file and environment/prod/terragrunt.hcl
```
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
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.22.0/24"]
}
```
4. The next step is to add your AWS credentials
For example you can run this commands in terminal.
```
export AWS_ACCESS_KEY_ID=<your_access_key_id>
export AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
export AWS_REGION=<your_aws_region> # Region must be the same as a in terragrunt.hcl file
```
5. Also you need to create 2 files environment/dev/secrets.hcl and environment/prod/secrets.hcl
```
inputs = {
github_token = "ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # your github token
}
```
6. The last step is to run Terragrunt
To start the project, go to the /environment/dev or /environment/prod directory and run these commands one by one if you don't get any error
```
terragrunt run-all init
```
```
terragrunt run-all plan
```
```
terragrunt run-all apply
```

7. If you need to destroy the infrastructure 
```
terragrunt run-all destroy
```




