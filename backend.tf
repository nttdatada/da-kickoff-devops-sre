# NTTDATA - DIGITAL ARCHITECTURE - ENGENIEER
# Create: Marcos Cianci - mlopesci@emeal.nttdata.com
# Date: Seg 7 Mar 2022
# PROJECT AWS FAULT INJECTION SERVICES


terraform {
  
  backend "s3" {
      bucket    = "da-engineer"
      key       = "terraform/da-kickoff-devops-sre.tfstate"
      region    = "us-east-1"
  }
}