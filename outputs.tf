output "wordpress_url" {
  value = "http://${module.ec2.public_ip}"
  description = "The public URL of the WordPress site"
}
output "sg_id" {
  value = aws_security_group.group.id
}