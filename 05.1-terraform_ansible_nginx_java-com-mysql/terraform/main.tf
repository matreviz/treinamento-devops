provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web2" {
  subnet_id = "subnet-03bd9d110e41f9f22"
  ami = "ami-0e66f5495b4efdd0f"
  associate_public_ip_address = true
  instance_type = "t2.medium"
  key_name =  "treinamento-itau-matheus"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-matheus-tf3"
  }
  vpc_security_group_ids = ["sg-0f8631bd731b35e7e"]
}

# terraform refresh para mostrar o ssh
output "aws_instance_e_ssh" {
  value = [
    "PUBLIC_DNS=${aws_instance.web2.public_dns}",
    "PUBLIC_IP=${aws_instance.web2.public_ip}",
    "ssh -i '~/.ssh/id_teste' ubuntu@${aws_instance.web2.public_dns} -o ServerAliveInterval=60"
  ]
}

# para liberar a internet interna da maquina, colocar regra do outbound "Outbound rules" como "All traffic"
# ssh -i ../../id_rsa_itau_treinamento ubuntu@ec2-3-93-240-108.compute-1.amazonaws.com
# conferir 
