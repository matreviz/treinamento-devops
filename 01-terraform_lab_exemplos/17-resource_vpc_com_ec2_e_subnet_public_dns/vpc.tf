resource "aws_vpc" "my_vpc_matheus" {
  cidr_block = "10.30.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "TerraformVPC_matheus"
  }
}

resource "aws_subnet" "my_subnet1_matheus" {
  vpc_id            = aws_vpc.my_vpc_matheus.id
  cidr_block        = "10.30.0.0/20"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tf-matheus-subnet1"
  }
}

resource "aws_subnet" "my_subnet2_matheus" {
  vpc_id            = aws_vpc.my_vpc_matheus.id
  cidr_block        = "10.30.32.0/20"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tf-matheus-subnet2"
  }
}
resource "aws_subnet" "my_subnet3_matheus" {
  vpc_id            = aws_vpc.my_vpc_matheus.id
  cidr_block        = "10.30.48.0/20"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "tf-matheus-subnet3"
  }
}
resource "aws_subnet" "my_subnet4_matheus" {
  vpc_id            = aws_vpc.my_vpc_matheus.id
  cidr_block        = "10.30.128.0/20"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "tf-matheus-subnet4_private"
  }
}

#resource "aws_internet_gateway" "gw_matheus" {
#  vpc_id = aws_vpc.my_vpc_matheus.id
#
#  tags = {
#    Name = "aws_internet_gateway_terraform"
#  }
#}

# resource "aws_route_table" "rt_terraform_matheus" {
#   vpc_id = aws_vpc.my_vpc_matheus.id

#   route = [
#       {
#         carrier_gateway_id         = ""
#         cidr_block                 = "0.0.0.0/0"
#         destination_prefix_list_id = ""
#         egress_only_gateway_id     = ""
#         #gateway_id                 = "igw-06455a30b330ab260"
#         gateway_id                 = ""
#         instance_id                = ""
#         ipv6_cidr_block            = ""
#         local_gateway_id           = ""
#         nat_gateway_id             = ""
#         network_interface_id       = ""
#         transit_gateway_id         = ""
#         vpc_endpoint_id            = ""
#         vpc_peering_connection_id  = ""
#       }
#   ]

#   tags = {
#     Name = "route_table_terraform_matheus"
#   }
# }

# resource "aws_route_table" "rt_terraform_matheus_private" {
#   vpc_id = aws_vpc.my_vpc_matheus.id

#   route = [
#       {
#         carrier_gateway_id         = ""
#         cidr_block                 = "0.0.0.0/0"
#         destination_prefix_list_id = ""
#         egress_only_gateway_id     = ""
#         gateway_id                 = ""
#         instance_id                = ""
#         ipv6_cidr_block            = ""
#         local_gateway_id           = ""
#         nat_gateway_id             = ""
#         network_interface_id       = ""
#         transit_gateway_id         = ""
#         vpc_endpoint_id            = ""
#         vpc_peering_connection_id  = ""
#       }
#   ]

#   tags = {
#     Name = "route_table_terraform_matheus_private"
#   }
# }

# resource "aws_route_table_association" "a1" {
#   subnet_id      = aws_subnet.my_subnet1_matheus.id
#   route_table_id = aws_route_table.rt_terraform_matheus.id
# }

# resource "aws_route_table_association" "a2" {
#   subnet_id      = aws_subnet.my_subnet2_matheus.id
#   route_table_id = aws_route_table.rt_terraform_matheus.id
#   }

# resource "aws_route_table_association" "a3" {
#   subnet_id      = aws_subnet.my_subnet3_matheus.id
#   route_table_id = aws_route_table.rt_terraform_matheus.id
# }

# resource "aws_route_table_association" "a4" {
#   subnet_id      = aws_subnet.my_subnet3_matheus.id
#   route_table_id = aws_route_table.rt_terraform_matheus_private.id
#}

# resource "aws_network_interface" "my_subnet" {
#   subnet_id           = aws_subnet.my_subnet.id
#   private_ips         = ["172.17.10.100"] # IP definido para instancia
#   # security_groups = ["${aws_security_group.allow_ssh1.id}"]

#   tags = {
#     Name = "primary_network_interface my_subnet"
#   }
# }