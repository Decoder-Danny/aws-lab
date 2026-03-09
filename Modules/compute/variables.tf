variable "subnet_id" {
    description = "Subnet of the EC2 instance"
    type = string
}

variable "sg_id" {
    description = "Security group of the EC2 instance"
    type=string
}

variable "instance_type" {
    default = "t2.micro"
}