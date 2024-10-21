


variable "ingressrules" {
  type    = list(number)
  default = [22, 443, 80]
}

variable "egressrules" {
  type    = list(number)
  default = [22, 443, 80]

}


# create db server ec2
resource "aws_instance" "db_server" {
  # ami             = "ami-079c0d2990b4033f4"
  ami             = "ami-07c5ecd8498c59db5"
  instance_type   = "t2.micro"
  key_name        = "vockey"
  security_groups = [aws_security_group.DB_servr_sg.name]

  tags = {
    Name = "DB Server"
  }
  user_data = file("server-script.sh")
}



# create security group
resource "aws_security_group" "DB_servr_sg" {
  name = "Allow Web Traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
}


output "db_server_public_ip" {
  value = aws_instance.db_server.public_ip
}


# create DaynamoDb Table 

resource "aws_dynamodb_table" "pokemonsDBTable" {
  name           = "pokemonsDBTable"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"

  attribute {
    name = "id"
    type = "N"
  }


  tags = {
    Name = "dynamodb-table"
  }
}

output "tableid" {
  value = aws_dynamodb_table.pokemonsDBTable.name
}
