# terraform-aws
This is a terraform script made with AWS modules.  
using this script you will be able to create 2 ec2 instances.  
one with a public subnet for Wordpress,  
and one private subnet for MySQL DB.  

First you will need to install AWS CLI 2 , via the amazon official site.

Use in commend line :

aws configure 

Input the following data : 

AWS Access Key ID [None]: accesskey  
AWS Secret Access Key [None]: secretkey  
Default region name [None]: your required region name    
Default output format [None]: json  

Generate key-pair for EC2.  
Write down the key-pair name in ec2.tf in lines [17, 31, 52]  
and make sure the pem file is located next to the main.tf


Before running the terraform script make sure use the following commend:   

terraform init  

After downloading the required providers use the next commend to make sure there are no errors:  

terraform plan

And after making sure there are zero problems you can start the script via the :

terraform apply

now you should access the wordpress via the public IP of your newly created EC2.

