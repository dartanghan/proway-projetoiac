provider "aws" {
    region = var.project_region    
}

# Observe que nao temos a definicao de backend aqui, logo usaremos o local
# por mais que enviemos os parametros de backend no terraform init
# Veja: Makefile -> build_iac e terraform/project/provider.tf