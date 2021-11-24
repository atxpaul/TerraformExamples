variable "application" {
  type        = string
  description = "Application name"
}

variable "location" {
  type        = string
  description = "Azure location of network components"
  default     = "westeurope"
}
