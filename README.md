# Hosting NodeJS Web Application on AWS using Terraform
## Creating a complete AWS Infrastructure project using Terraform for a Highly Available NodeJS Web Application.
These services were used:
1. Elastic Beanstalk - T2.micro, Load Balancer, Autoscaling group
2. RDS
3. VPC with Private & Public Subnets

Study case:
```
A company based in UK wants to deploy its application on AWS. The application contains a website which is accessed by its customers mainly in Europe, but they want to expand their customer base soon in other parts of the world. The website is a NodeJS application using SQL based databases. Website should have the capacity to absorb incoming traffic as much as 10x of the usual traffic. It consists of lots of images which are stored and accessed at run time by the application. The infrastructure hosting this website should not be publicly accessible to ensure security. The infrastructure should be highly available and reliable enough to ensure no downtime as the company cannot afford any downtime since it's a business critical application. Some part ( Not All ) of the infrastructure should be in from of code so that its easy to replicate this infrastructure . You have to ensure the data is encrypted and only accessible to concerned people / services . As a solution architect you have to propose and design a fully secure and highly available infrastructure to the company with roughly estimated cost per month.
```

Infrastructure used:

![Architectures](/ProjectArchitecture.png)

## Steps Followed:

1. Location will be London for lower latency.

2. Create the resources using Terraform:

    a. Create a VPC with two private subnets & one public subnet.
    b. Create Nat & Internet Gateways, attach them to VPC (Assign Nat Gatway to Public subnet), and use two route tables to route the IG to the public subnets and NatGW to the private subnets. Make sure the subnets are associated with each route table.

    b. Create security group and allow SSH for bastion, RDS/Mysql, http, and https, for inbound and outboud.
    
    c. Create NACL and attach it with the VPC which allows SSH, Mysql, http, and https, for inbound.

3. Using Elastic Beanstalk, create a new application with NodeJS runtime. Choose EC2 instance with the security groups in the private subnet with autoscaling of 10X. Also create ELB and assign it to the Autoscaling group.
4. Create RDS with Encryption settings in the private subnet. the RDS is accessable in the VPC using the MySQL host URL.
5. Create a bastion server to access the EC2 instances running with Elastic beanstalk.