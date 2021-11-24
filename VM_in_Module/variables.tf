variable "application" {
  type        = string
  description = "Application name"
}

variable "location" {
  type        = string
  description = "Azure location of network components"
  default     = "westeurope"
}

variable "admin_username" {
  type        = string
  description = "Local admin user"
}
variable "admin_password" {
  type        = string
  description = "Local admin password"
  sensitive   = true
}

variable "vm_size" {
  type        = string
  description = "Size for the VM"
}

variable "os" {
  description = "OS image to deploy"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "vnet_address_space" {
  type        = list(any)
  description = "Address space for Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "snet_address_space" {
  type        = list(any)
  description = "Address space for Subnet"
  default     = ["10.0.0.0/24"]
}