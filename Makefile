.PHONY: init plan apply destroy build deploy clean docker-build docker-run azure-deploy azure-destroy

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve

build:
	npm install
	npm run build

deploy: build apply
	./deploy.sh

clean:
	rm -rf node_modules dist .terraform terraform.tfstate*

docker-build:
	docker build -t jewelry-app .

docker-run: docker-build
	docker run -p 8080:80 jewelry-app

azure-deploy: init
	terraform apply -auto-approve
	@echo "Aguarde alguns minutos para a aplicação inicializar..."
	@echo "URL: http://$$(terraform output -raw vm_public_ip):8080"

azure-destroy:
	terraform destroy -auto-approve
