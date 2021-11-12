terraform {
  backend "remote" {
    organization = "treinamento-itau"

    workspaces {
      name = "treinamento_gama_matheus"
    }
  }
}
