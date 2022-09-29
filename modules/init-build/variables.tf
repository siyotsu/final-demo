variable "aws_region" {
  description = "AWS region"
}

variable "aws_profile" {
  description = "AWS profile"
}

variable "remote_state_bucket" {}

variable "image_tag" {
    type = string
}

variable "working_dir" {
    type = string
}

variable "registry_id" {
    type = string
}

variable "app_name" {
    type = string
}
