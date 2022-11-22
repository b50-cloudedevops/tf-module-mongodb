#resource "aws_docdb_cluster" "docdb" {
#  cluster_identifier      = "roboshop-${var.ENV}"
#  engine                  = "docdb"
#  master_username         = "admin1"
3  master_password         = "roboshop1"
# true only during in prod, we will take a snapshot and that time value wiil bw false
#  skip_final_snapshot     = true
#}
#creates subnet group 
resource "aws_docdb_subnet_group" "docdb" {
  name       = "roboshop-mongo-${var.ENV}"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "My docdb subnet group"
  }
}