variable "environment" {
    description = "environment name"
  
}

variable "location" {
  description = "location of the resources"
}

variable "ip" {
  default = ["10.0.0.0/16"]
}
