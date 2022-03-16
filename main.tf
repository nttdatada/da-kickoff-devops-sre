# NTTDATA - DIGITAL ARCHITECTURE - ENGENIEER
# Create: Marcos Cianci - mlopesci@emeal.nttdata.com
# Date: Seg 14 Mar 2022
# PROJECT KICKOFF DEVOPS & SRE


module "ec2_grafana" {

    source                  = "git::https://github.com/nttdatada/terraform-aws-ec2.git"

    ec2_name                = "grafana-${terraform.workspace}"
    iam_instance_profile    = module.instance_profile_ec2_grafana.instance_profile_name
    ami                     = data.aws_ami.ubuntu.id
    monitoring              = true
    vpc_security_group_ids  = [ module.sg_grafana.security_group_id ]
    subnet_id               = "subnet-2eb65362"

    user_data               = data.template_file.user_data_grafana.rendered

    root_block_device = [
        {
            encrypted       = true
            volume_type     = "gp3"
            throughput      = 200
            volume_size     = 30
            
            tags = {

                Name = "grafana-root-block"
            }  
        },
    ]

    ebs_block_device = [
        {
            device_name = "/dev/sdf"
            volume_type = "gp3"
            volume_size = 50
            throughput  = 200
            encrypted   = true
        }
    ]

    tags = var.tags 
}

### AWS Security Group ###

module "sg_grafana" {

    source          = "git::https://github.com/nttdatada/terraform-aws-securitygroup.git"

    name_sg         = "scg-grafana-ec2-${terraform.workspace}"
    vpc_id          = data.aws_vpc.vpc.id
    environments    = terraform.workspace
    tags            = var.tags

    sg_rules = [

        {
            type = "egress"
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = "0.0.0.0/0"
            description = "Allow Trafic Outbound"
        },
        {
            type = "ingress"
            from_port = 22
            to_port = 22
            protocol = "TCP"
            cidr_blocks = "0.0.0.0/0"
            description = "Allow SSH"
        },
        {
            type = "ingress"
            from_port = 3000
            to_port = 3000
            protocol = "TCP"
            cidr_blocks = "0.0.0.0/0"
            description = "Allow Grafana Web"
        },

    ]
} 


### AWS IAM ###

# AWS EC2 #
module "role_ec2_grafana" {

    source = "git::https://github.com/nttdatada/terraform-aws-iam.git//roles?ref=v1.0"

    role_name       = "role-ec2-grafana-${terraform.workspace}"
    role_json       = file("./templates/iam/role-ec2.json")
}

module "instance_profile_ec2_grafana" {

    source = "git::https://github.com/nttdatada/terraform-aws-iam.git//iam_instance_profile?ref=v1.0"

    name_instance_profile = "instance-profile-ec2-grafana-${terraform.workspace}"
    role_id               = module.role_ec2_grafana.role-id 

}