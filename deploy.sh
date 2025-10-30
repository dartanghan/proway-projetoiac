#!/bin/bash

# Obter nome do bucket do Terraform
BUCKET_NAME=$(terraform output -raw website_url | cut -d'.' -f1)

# Upload dos arquivos para S3
aws s3 sync dist/ s3://$BUCKET_NAME --delete

echo "Deploy concluído para: http://$BUCKET_NAME.s3-website-us-east-1.amazonaws.com"
