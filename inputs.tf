variable "name" {
  type = string
}

variable "availability_domain_ocid" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "shape" {
  type = string
  default = "VM.Standard.E3"
}

variable "cpu" {
  type = number
  default = 2
}

variable "memory" {
  type = number
  default = 4
}

variable "image_name" {
  type = string
}

variable "subnet_ocid" {
  type = string
}

variable "public_key" {
  type = string
}