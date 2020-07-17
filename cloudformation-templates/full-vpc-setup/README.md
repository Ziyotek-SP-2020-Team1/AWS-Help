# Full VPC Setup Cloudformation Template
This template was created to get the process of writing VPC creation template easier with nested stacks for better use and easy changes, and availability to configure every part of the resources with parameters.

## Template Structure

 - vpc
	 - subnet
	 - internet gateway
	 - route table
		 - subnet associate to route table
	 - security group

![Template Structure](https://raw.githubusercontent.com/usmonovsardor7770/AWS/master/cloudformation-templates/full-vpc-setup/template-structure.png)
## Configurable Parameters

 - VPC Name
 - VPC CIDR Block
 - Subnet 1 - 4
	 - Subnet Name, Availability Zone, 3rd octet in ip, number of CIDR generated, subnet mask
- Rout Table Name
- Security Group
- Template URL