# NTTDATA - DIGITAL ARCHITECTURE - ENGENIEER
# Create: Marcos Cianci - mlopesci@emeal.nttdata.com
# Date: Seg 7 Mar 2022
# PROJECT AWS FAULT INJECTION SERVICES


### NETWORK ###

data "aws_vpc" "vpc" {

    filter {
        name = "tag:Name"
        values = [ "vpc_main" ]
    }

}


data "aws_subnet" "subnet-c" {
    filter {
        name = "tag:Name"
        values = ["subnet-c"]
    }
}


data "aws_subnet" "subnet-d" {
    filter {
        name = "tag:Name"
        values = ["subnet-d"]
    }
}

### AMI ###

data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-*.*-amd64-server-*"]
    }

    owners = [ "099720109477" ]

}