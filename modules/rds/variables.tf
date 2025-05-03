variable "subnet_ids" {
  description = "List of subnet IDs for the RDS subnet group"
  type        = list(string)
}
variable "db_name" {
  description = "The name of the RDS database"
  type        = string
  default     = "wordpressdb"
}
variable "db_user" {
  description = "The username for the RDS database"
  type        = string
}
variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true 
}
variable "sg_id" {
  description = "Security group ID to attach to the RDS instance"
  type        = string
}