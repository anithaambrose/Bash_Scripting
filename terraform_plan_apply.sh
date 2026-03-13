#!/bin/bash
#
# Automates the process of running terraform plan and applying the changes without manual approval. 
#
cd /path/to/terraform
terraform init
terraform plan -out=tfplan
terraform apply -auto-approve tfplan
