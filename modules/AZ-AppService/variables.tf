variable "appserviceplanname" {
  description = "Name of the App Service Plan"
  type        = string
  
}
variable "appservicename" {
  description = "Name of the App Service"
  type        = string
  
}
variable "location" {
  description = "Azure region where the resources will be created"
  type        = string
}
variable "resourcegroupname" {
  description = "Name of the Resource Group where the resources will be created"
  type        = string
  
}
