PROJETO = dart-prowayteste
REGION = us-west-1

default: deploy

%.build_iac:
	cd terraform/$* && \
		rm -rf .terraform && \
		terraform init -backend-config="bucket=${PROJETO}-terraform-state" -backend-config="region=${REGION}" && \
		terraform apply -var "project_name=${PROJETO}" -var project_region="${REGION}" --auto-approve 

%.destroy_iac:
	cd terraform/$* && \
		terraform destroy --auto-approve -var "project_name=${PROJETO}" -var project_region="${REGION}"

deploy:
	$(MAKE) build_iac

undeploy:
	$(MAKE) destroy_iac

build_iac:
	$(MAKE) structure.build_iac
	$(MAKE) project.build_iac

destroy_iac:
	$(MAKE) project.destroy_iac
	$(MAKE) structure.destroy_iac