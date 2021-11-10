*** Programa qual é o recurso que iremos criar no provider, exemplo uma máquina feita na AWS t2.micro com a AMI(codigo da máquina) ami-09e67e426f25ce0d7

```tf
resource "aws_instance" "web" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  tags = {
    Name = "Minha Maquina Simples EC2"
  }
}
```
```
provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  count = 01
  subnet_id     = "subnet-05bbad60360717eb2"
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-tf-${count.index}"
  }
}

output "instance_ip_add" {
  value = [
          for key, item in aws_instance.web:
                "${item.private_ip} - ${item.public_dns}"
          ]
  description = "Mostra os IPs publicos e privados da maquina criada."
}
```