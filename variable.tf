variable "ami" {
    type        = string
    description = "The AMI ID to use for the EC2 instance"
    default     = "ami-06cdac14c9c4da91b"
  
}

variable "instance_type" {
    type        = string
    description = "The instance type to use for the EC2 instance"
    default     = "t3.micro"
}

variable "key_name" {
    type        = string
    description = "The name of the key pair to use for the EC2 instance"
    default     = "funso"
}

variable "vpc_id" {
    type        = string
    description = "The ID of the VPC where the security group will be created"
    default     = "vpc-0ea9b12ce1c86f529"
}

variable "environment" {
    type        = string
    description = "The environment for the EC2 instance"
    default     = "dev"
}

variable "subnet_ids" {
    type        = list(string)
    description = "The IDs of the subnets where the EC2 instance will be launched"
    default     = ["subnet-01efbe10fd62eb85e", "subnet-02dde43f7a40ea98c", "subnet-073d2ff1005a84fe5"]
}