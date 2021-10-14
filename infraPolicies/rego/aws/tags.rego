package cycloid.tf_aws_ec2

resource_type = "aws_instance"


ensure ec2 no public IP
VPC security group rules should not permit ingress from '0.0.0.0/0' except to ports 80 and 443
VPC security group rules should not permit ingress from '0.0.0.0/0' to port 22 (SSH)




__rego__metadoc__ := {
  "custom": {
    "controls": {},
    "severity": "Medium"
  },
  "description": "EC2 instances should not have a public IP association (IPv4). Publicly accessible EC2 instances are reachable over the internet even if you have protections such as NACLs or security groups. If these protections are accidentally removed your instances may be vulnerable to attack.",
  "id": "FG_R00271",
  "title": "EC2 instances should not have a public IP association (IPv4)"
}

allow {


}


deny{

}

