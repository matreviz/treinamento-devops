provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
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
    Name = "${var.nome}"
  }
  vpc_security_group_ids = ["sg-0f8631bd731b35e7e"]
}
# teste
output "instance_ip_dns" {
  value = [
    aws_instance.web.public_dns, 
    aws_instance.web.public_ip, 
    aws_instance.web.private_ip,
    "ssh -i ~/.ssh/id_teste ubuntu@${aws_instance.web.public_dns}"
  ]
  description = "output ec2"
}