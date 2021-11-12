module "criar_instancia" {
  source = "git@github.com:matreviz/mod_create_ec2.git"
  nome = "ec2-teste-modulo-matheus"
}

output "out" {
    value = [module.criar_instancia.instance_ip_dns]
}