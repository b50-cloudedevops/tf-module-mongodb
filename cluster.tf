resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "roboshop-${var.ENV}"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "roboshop1"
  # true only during in prod, we will take a snapshot and that time value wiil bw false
  skip_final_snapshot     = true
}
#creates subnet group 
resource "aws_docdb_subnet_group" "docdb" {
  name       = "main"
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

  tags = {
    Name = "My docdb subnet group"
  }
}