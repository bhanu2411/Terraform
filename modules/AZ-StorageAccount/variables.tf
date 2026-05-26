variable "storageaccountname" {
  description = "Name of the Storage Account"
}

variable "location" {
  description = "Location of the Storage Account"
}

variable "resourcegroupname" {
  description = "Name of the Resource Group" 
}

variable "environment" {
  description = "Environment tag for the Storage Account"
}
variable "deploy" {
  type = bool
}
