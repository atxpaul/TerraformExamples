variable "rgname" {
  type        = string
  description = "Name of resource group"
}
variable "location" {
  type        = string
  description = "Azure location of storage account environment"
  default     = "westeurope"
}

variable "environment" {
  type        = string
  description = "Type of environment"
  default     = "stagging"
}
