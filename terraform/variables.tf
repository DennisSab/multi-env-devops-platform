variable "project_name" {
  description = "Name prefix for resources"
  type        = string
  default     = "multi-env-devops"
}

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "EC2 instance type (Free Tier)"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Existing EC2 Key Pair name for SSH"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Your public IP in CIDR format, e.g. 1.2.3.4/32"
  type        = string
}

variable "create_eip" {
  description = "Whether to allocate and associate an Elastic IP"
  type        = bool
  default     = true
}