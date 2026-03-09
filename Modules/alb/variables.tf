variable "vpc_id" {
    description = "The ID of the VPC"
    type = string
}

variable "public_subnet_ids" {
    description = "A list of public subnet IDs" 
    type = list(string)
}
