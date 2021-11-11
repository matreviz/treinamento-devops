variable "security_group" {
  type        = string
  description = "Digite a chave do seu security group"

  validation {
    condition     = substr(var.security_group, 0, 3) == "sg-"
    error_message = "O valor do security group não é válido, tem que começar com \"sg-\"."
  }
}

variable "subnet" {
  type        = string
  description = "Digite a chave da sua subnet"

  validation {
    condition     = substr(var.subnet, 0, 7) == "subnet-"
    error_message = "O valor do security group não é válido, tem que começar com \"subnet-\"."
  }
}

variable "image_id" {
  type        = string
  description = "O id do Amazon Machine Image (AMI) para ser usado no servidor."

  validation {
    condition     = substr(var.image_id, 0, 4) == "ami-"
    error_message = "O valor do image_id não é válido, tem que começar com \"ami-\"."
  }
}

variable "instance_type" {
  type        = string
  description = "Digite o tipo de instancia que você deseja:"

  validation {
    condition     = substr(var.instance_type, 0, 3) == "t2."
    error_message = "O valor do tipo de instancia não é válido, tem que começar com \"t2.\"."
  }
}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
  subnet_id     = var.subnet
  ami= var.image_id
  associate_public_ip_address = true
  instance_type = var.instance_type
  key_name =  "treinamento-itau-matheus"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-matheus-tf"
  }
  vpc_security_group_ids = [ var.security_group ]
}
# teste
output "instance_ip_dns" {
  value = [
    aws_instance.web.public_dns, 
    aws_instance.web.public_ip, 
    aws_instance.web.private_ip,
    "ssh -i ~/.ssh/id_rsa_tr ubuntu@${aws_instance.web.public_dns}"
  ]
  description = "Mostra o public dns"
}
# /////