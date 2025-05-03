resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "group-3-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "group-3-subnet-group"
  }
}

resource "aws_db_instance" "wordpress_db" {
  identifier         = "group3-db"
  engine             = "mysql"
  engine_version    = "8.0.35"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  db_name            = var.db_name
  username           = var.db_user
  password           = var.db_password
  vpc_security_group_ids = [var.sg_id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  publicly_accessible    = true
  skip_final_snapshot    = true
  tags = {
    Name = "group-3-wordpress-db"
  }
}