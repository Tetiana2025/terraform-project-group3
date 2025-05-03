variable "vpc_cidr" {
  type        = string
  default = "10.0.0.0/16"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
}

variable "bastion_cidr" {
  description = "CIDR block for Bastion host"
}

variable "db_name" {
  type        = string
  default = "wordpressdb"
}

variable "db_user" {
  default = "wpuser"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "public_key_path"  { default = "~/.ssh/id_rsa.pub" }
