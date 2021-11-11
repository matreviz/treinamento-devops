provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web1" {
  subnet_id     = "subnet-03bd9d110e41f9f22"
  ami= "ami-0e66f5495b4efdd0f"
  associate_public_ip_address = true
  instance_type = "t2.micro"
  key_name =  "treinamento-itau-matheus"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-matheus-tf01"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_matheus.id}"]
}
# teste
output "instance_ip_dns" {
  value = [
    aws_instance.web1.public_dns, 
    aws_instance.web1.public_ip, 
    aws_instance.web1.private_ip,
    "ssh -i ~/.ssh/id_teste ubuntu@${aws_instance.web1.public_dns}"
  ]
  description = "Mostra o public dns"
}