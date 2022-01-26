
variable "region" {
  description = "AWS Region to deploy Server in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.small"
}

variable "enable_detailed_monitoring" {
  type    = bool
  default = false
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map
  default = {
    Owner       = "Alex Tchaikovski"
    Project     = "Skill factory P9 project"
    Purpose     = ""
  }
}

variable "domain_tchaikovski_link" {
  default = "tchaikovski.link"
}

variable "database_host_name" {
  type = string
  default = "database"
}

variable "docker_host_name" {
  type = string
  default = "docker"
}

variable "az" {
  type = string
  default = "us-east-1a"
}

variable "public_key" {}

variable "private_key" {}

variable docker_count {
  type = number
}

variable database_count {
  type = number
}