# This package specifies rules to be applied into the ec2
package cycloid_tf.aws.tags

import tags_ok

# imports -> by default should be tfplan to check if possible to add others
import input.tfplan.aws_instance as aws_instance
import input.tfplan.aws_security_group as aws_security_group

# resources to be considered in this rule, can be a list as well
resource_type = { "aws_instance", "aws_security_group" }

# validate only uses in prod and stage 

# check rules iso validate into different for providers best practice iso
# 


######
# ALL
######

# Check if tag corresponds to the cycloid standard : 
# not possible to check organisation -> check done on the be side -> what if client wants to do it?
# Considering default
  # standard_tags = {
  #   "cycloid.io" = "true"
  #   env          = var.env
  #   project      = var.project
  #   client       = var.customer
  #   organization = var.customer
  # }

tags_ok(resource) {
  resource.tags["cycloid.io"] == "true"
  resource.tags["env"] == input.environment_canonical
  resource.tags["project"] == input.project_canonical
  # resouce.tags["client"] ==
  # resouce.tags["organization"] ==
}

deny[reason]{
  tags_ok(resource_type[index])
  reason := sprintf("not founf the default tags required by the resource %q", [resource.address])
}

######
# EC2
######

# EC2 instances should not have a public IP association (IPv4)
default deny = false

deny {
  tfplan.associate_public_ip_address == true
  tplan.public_ip != ""
}


######
# security_group
######

# VPC security group should not allow ingress from 0.0.0.0/0 except in ports 80 and 443


# VPC security group should not allow  certain address

######
# Policy - tags
######




# check instance tags

prod_servers[name] {
    site := sites[_]
    site.name == "prod"
    name := site.servers[_].name
}

apps_in_prod[name] {
    app := apps[_]
    server := app.servers[_]
    prod_servers[server]
    name := app.name
}

apps_not_in_prod[name] {
    name := apps[_].name
    not apps_in_prod[name]
}

