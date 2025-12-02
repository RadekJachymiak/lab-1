variable "server-name" {
  type        = string
  description = "Na0me of a server to provision"
}

locals {
  minNumberOfServer = 1
  maxNumberOfServer = 10
}


variable "number-of-servers" {
  type = number
  description = "Required number of servers"
  validation {
    condition = var.number-of-servers >= local.minNumberOfServer && var.number-of-servers < local.maxNumberOfServer
    error_message = "The number of servers must be between ${local.minNumberOfServer} and ${local.maxNumberOfServer}"
  }
}

output "out" {
  value = var.server-name
}

