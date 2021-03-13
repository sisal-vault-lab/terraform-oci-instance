variable "OCI_TENANCY_ID" {
  type = string
  description = "OCID of your tenancy."
  
  validation {
    condition = split("..", var.OCI_TENANCY_ID)[0] == "ocid1.tenancy.oc1"
    error_message = "Validation failed."
  }
}

variable "OCI_USER_ID" {
  type = string
  description = "OCID of the user calling the API."
  
  validation {
    condition = split("..", var.OCI_USER_ID)[0] == "ocid1.user.oc1"
    error_message = "Validation failed."
  }
}

variable "OCI_PRIVATE_KEY" {
  type = string
  description = "The contents of the private key file."
  
  sensitive = true
  
  validation {
    condition = length(var.OCI_PRIVATE_KEY) >= 0
    error_message = "Validation failed."
  }
}

variable "OCI_KEY_FINGERPRINT" {
  type = string
  description = "Fingerprint for the key pair being used."
  
  validation {
    condition = length(var.OCI_KEY_FINGERPRINT) >= 0
    error_message = "Validation failed."
  }
}

variable "OCI_REGION_NAME" {
  type = string
  description = "An Oracle Cloud Infrastructure region."
  
  validation {
    condition = length(var.OCI_REGION_NAME) >= 0
    error_message = "Validation failed."
  }
}
