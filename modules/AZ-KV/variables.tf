variable "keyvaultname" {
  description = "Name of the Key Vault" 
}
variable "resourcegroupname" {
  description = "Name of the Resource Group"
}
variable "location" {
  description = "Location of the Key Vault"
}
variable "deploy" {
  type = bool
}