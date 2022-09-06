variable "region" {
    default = "us-east-2"
}

variable "vpc_full_cidr_block" {
    default = "10.0.0.0/16"
}

variable "primary_public_cidr_block" {
    default = "10.0.1.0/24"
}

variable "primary_private_cidr_block" {
    default = "10.0.2.0/24"
}

variable "ha_public_cidr_block" {
    default = "10.0.3.0/24"
}

variable "ha_private_cidr_block" {
    default = "10.0.4.0/24"
}

variable "zonea" {
    default = "us-east-2a"
}

variable "zoneb" {
    default ="us-east-2b"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_name" {
    default = "mykp"
}