provider "aws" {
  region = "us-east-1"
}

module "criar_instancia" {
  source = "/home/ubuntu/treinamento-devops/01-terraform_lab_exemplos/19-module/meu-modulo"
  nome = "ec2-teste-modulo-matheus"
}
