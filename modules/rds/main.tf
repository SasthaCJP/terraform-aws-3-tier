resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "sss-db-subnet-group"
  subnet_ids = var.private_db_subnet_ids

  tags = merge(var.tags, {
    Name = "sss-db-subnet-group"
  })
}

resource "aws_db_instance" "db_instance" {
  identifier             = "sss-db-instance"
  instance_class         = "db.t3.micro" # Ensure this instance class is supported with your MySQL version
  engine                 = "mysql"
  engine_version         = "8.0.39" # You may need to check for supported MySQL versions for the instance class
  allocated_storage      = 20
  username               = var.db_username
  password               = var.db_password
  db_name                = "mydatabase"
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.db_security_group_id] # This should point to the correct security group in the same VPC
  multi_az               = false
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name # Link the DB subnet group
  tags = merge(var.tags, {
    Name = "sss-db-instance"
  })
}
