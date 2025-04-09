A networking module that should: 
1. Create a VPC with a given CIDR block
2. Allow the user to provide the configuration for multiple subnets:
    2.1 The user should be able to mark a subnet as public or private
    2.2 The user should be able to provider CIDR blocks
    2.3 The user should be able to provide AWS AZ
        2.3.1 If at least one subnet is public, we need to deploy an Internet Gateway (IGW)
        2.3.2 We need to associate the public subnets with a public route table (RTB)