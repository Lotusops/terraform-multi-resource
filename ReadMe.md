## Instructions

## Installation
- Install Chocolatey - For Windows instructions are here - https://chocolatey.org/install
- Install Terraform - https://learn.hashicorp.com/tutorials/terraform/install-cli

## Generate SSH key
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

- SSH key is by default installed under C:\Users\<user>\.ssh
- id_rsa is the private key. You never share this key with anyone.
- id_rsa.pub is the public key

## Setup
Create a file named terraform.tfvars in line with all the other files
```
aws_access_key = "<your aws access key id>"

aws_secret_key = "<your aws secret access key id>"

ssh_public_key = "<your ssh public key here - content of id_rsa.pub>"
```

## Terraform commands
Open command prompt at the folder where you have created files - main.tf and providers.tf
```
terraform init					[initializes your provider]

terraform plan					[shows you what resources would be created/updated/destroyed]

terraform apply	-auto-approve	[creates resources]

terraform destroy -auto-approve	[destroys resources]
```

## Connect to the new EC2 instance
- Login to AWS web console
- Go to EC2 service
- Open the new EC2 instance that you created using Terraform
- Get the public IP
- Run following command in Git Bash
```
ssh -i ~/.ssh/id_rsa ec2-user@<publi_ip_address_of_ec2_instance>
```

## Linux Commands
- echo "Hello World"
- ls
- man <command>
- echo "Hello World" > file.txt
- mv file.txt renamedfile.txt
- cp file.txt newfile.txt
- rm newfile.txt
- mkdir folder1
- mkdir -p folder1/folder1.1/folder1.1.1
- rm -rf folder1
- nano file.txt
- cat file.txt
- cat file.txt | grep hello
- cat file.txt | grep hello | wc -l
- grep -r hello
- nano shellscript.sh
  ```
  #!/bin/bash

  echo "Hello World!"

  cond=false

  if [ cond == true ]; then
    echo "condition true"
  else
    echo "condition false"
  fi
  ```
- chmod +x shellscript.sh   [make file executable]
- ./shellscript.sh          [execute shellscript]
