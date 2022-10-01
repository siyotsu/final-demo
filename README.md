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
