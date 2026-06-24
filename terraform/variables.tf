variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "3tier-app"
}

variable "db_name" {
  default = "transactions"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  sensitive = true
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}
