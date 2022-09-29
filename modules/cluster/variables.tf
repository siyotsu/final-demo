variable "aws_region" {
  description = "AWS region"
}

variable "aws_profile" {
  description = "AWS profile"
}

variable "remote_state_bucket" {}

variable "key_name" {
  type        = string
  description = "The name for ssh key, used for aws_launch_configuration"
  default = "test-key-dev"
}

variable "cluster_name" {
  type        = string
  description = "The name of AWS ECS cluster"
  default = "app-dev-cluster"
}

locals {
  repository_name = format("%s-%s", var.app_name, var.environment)
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type = list
}

variable "private_subnet_cidrs" {
  type = list
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 5000
}

variable "number_cpu" {
  type = number
  description = "Instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = 4
}

variable "number_memory" {
  type = number
  description = "Instance memory to provision (in MiB)"
  default     = 256
}

variable "environment" {
  type = string
}

variable "app_name" {
  type = string
}

variable "taskdef_template" {
  default = "cb_application.json.tpl"
}

locals {
  app_image = format("%s:%s", var.ecr_repository_url, var.image_tag)
}

variable "ecr_repository_url" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "ec2-sg-name" {
  type = string
  default = "allow-all-ec2"
}

variable "ec2-sg-description" {
  type = string
  default = "allow all"
}

variable "ltemplate-name" {
  type = string
  default = "test_ecs"
}

variable "ltemplate-instance-type" {
  type = string
  default = "t2.micro"
}

variable "asg-name" {
  type = string
  default = "test-asg"
}

variable "ecs_capacity_provider_name" {
  type = string
  default = "capacity-provider-test"
}

variable "task_definition_family" {
  type = string
  default = "web-family"
}

variable "task_definition_network_mode" {
  type = string
  default = "bridge"
}

variable "ecs-service-name" {
  type = string
  default = "web-service"
}

variable "ecs-container-name" {
  type = string
  default = "app"
}

variable "ecs-container-port" {
  type = number
  default = 5000
}

variable "lb-name" {
  type = string
  default = "test-ecs-lb"
}

variable "lb-type" {
  type = string
  default = "application"
}

variable "sec-group-lb-name" {
  type = string
  default = "allow-all-lb"
}

variable "lb-target-group-name" {
  type = string
  default = "lb-target-group"
}

variable "lb-target-group-port" {
  type = string
  default = "80"
}

variable "lb-target-group-protocol" {
  type = string
  default = "HTTP"
}

variable "lb-target-group-type" {
  type = string
  default = "instance"
}

variable "lb-listener-port" {
  type = string
  default = "80"
}

variable "lb-listener-protocol" {
  type = string
  default = "HTTP"
}
