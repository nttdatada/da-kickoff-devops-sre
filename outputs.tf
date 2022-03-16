# NTTDATA - DIGITAL ARCHITECTURE - ENGENIEER
# Create: Marcos Cianci - mlopesci@emeal.nttdata.com
# Date: Seg 7 Mar 2022

#### PROJECT KICKOFF DEVOPS & SRE ####

### AWS IAM ###

output "role_id_grafana" {
  
  description = ""
  value       = module.role_ec2_grafana.role-id
}

output "instance_profile_name_ec2_grafana" {

    description = ""
    value = module.instance_profile_ec2_grafana.instance_profile_name
}


### AWS SECURITY GROUP ###

output "security_group_id_ec2_grafana" {

  description = ""
  value = module.sg_grafana.id

}
