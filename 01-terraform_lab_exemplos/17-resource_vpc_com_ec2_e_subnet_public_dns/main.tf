provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web1_matheus" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  key_name =  "treinamento-itau-matheus" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet1_matheus.id # vincula a subnet direto e gera o IP automático
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform_matheus.id}",
  ]

  tags = {
    Name = "maquina utilizando subnet1 com acesso a internet"
  }
}

resource "aws_instance" "web2_matheus" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  key_name =  "treinamento-itau-matheus" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet2_matheus.id # vincula a subnet direto e gera o IP automático
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform_matheus.id}",
  ]

  tags = {
    Name = "maquina utilizando subnet2 com acesso a internet"
  }
}

resource "aws_instance" "web3_matheus" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  key_name =  "treinamento-itau-matheus" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet3_matheus.id # vincula a subnet direto e gera o IP automático
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform_matheus.id}",
  ]

  tags = {
    Name = "maquina utilizando subnet3 com acesso a internet"
  }
}
resource "aws_instance" "web4_matheus" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  key_name =  "treinamento-itau-matheus" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet4_matheus.id # vincula a subnet direto e gera o IP automático
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform_matheus.id}",
  ]

  tags = {
    Name = "maquina utilizando subnet4 sem acesso a internet"
  }
}
# terraform refresh para mostrar o ssh

output "aws_instance_e_ssh" {
  value = [
    "ssh -i ~/.ssh/id_rsa_teste ubuntu@${aws_instance.web1_matheus.public_dns}",
    "ssh -i ~/.ssh/id_rsa_teste ubuntu@${aws_instance.web2_matheus.public_dns}",
    "ssh -i ~/.ssh/id_rsa_teste ubuntu@${aws_instance.web3_matheus.public_dns}",
    "ssh -i ~/.ssh/id_rsa_teste ubuntu@${aws_instance.web4_matheus.public_dns}"
  ]
}