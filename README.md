# Jewelry App

Aplicação Vue.js para exibição de joias com deploy automatizado no Azure usando Terraform.

## Pré-requisitos

- Node.js 18+
- Docker
- Terraform
- Azure CLI (para deploy)

## Execução Local

### Desenvolvimento
```bash
# Instalar dependências
npm install

# Executar em modo desenvolvimento
npm run dev
```
Acesse: http://localhost:5173

### Docker Local
```bash
# Usando Makefile
make docker-run

# Ou manualmente
docker build -t jewelry-app .
docker run -p 8080:80 jewelry-app
```
Acesse: http://localhost:8080

## Deploy no Azure

### Configuração Inicial
```bash
# Login no Azure
az login

# Configurar credenciais (se necessário)
az account set --subscription "sua-subscription-id"
```

### Deploy Automatizado
```bash
# Deploy completo (build + infraestrutura + aplicação)
make azure-deploy
```

### Deploy Manual
```bash
# 1. Inicializar Terraform
make init

# 2. Planejar mudanças
make plan

# 3. Aplicar infraestrutura
make apply

# 4. Build e deploy da aplicação
make deploy
```

## Comandos Úteis

```bash
# Build da aplicação
make build

# Limpar arquivos temporários
make clean

# Destruir infraestrutura Azure
make azure-destroy
```

## Estrutura do Projeto

```
├── src/           # Código fonte Vue.js
├── main.tf        # Configuração Terraform
├── Dockerfile     # Container da aplicação
├── Makefile       # Comandos automatizados
└── deploy.sh      # Script de deploy
```

## Infraestrutura Azure

O Terraform provisiona:
- Resource Group
- Virtual Network e Subnet
- Network Security Group
- VM Linux com Docker
- IP Público

A aplicação roda na porta 8080 da VM.
