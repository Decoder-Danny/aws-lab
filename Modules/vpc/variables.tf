variable "VPC-CIDR" {
    description = "CIDR range of VPC instance"
    type = string
}

variable "public_subnet_cidr" {
    description = "CIDR range of public subnet"
    type = list(string)
}

variable "private_subnet_cidr" {
    description = "CIDR range of private subnet"
    type = string
}