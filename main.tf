variable "server-name" {
  type        = string
  default = "server"
  description = "Na0me of a server to provision"
}

locals {
  minNumberOfServer = 1
  maxNumberOfServer = 10
}

locals {
    countOfItems = {
        disks = 13
        servers = 22
        
    }
}


variable "number-of-servers" {
  type = number
  description = "Required number of servers"
  default = 2
  validation {
    condition = var.number-of-servers >= local.minNumberOfServer && var.number-of-servers < local.maxNumberOfServer
    error_message = "The number of servers must be between ${local.minNumberOfServer} and ${local.maxNumberOfServer}"
  }
}

variable "number-of-disks" {
 type = number 
}

output "out" {
  value = var.server-name
}

variable "list-of-names" {
  type = list(string)
}

output "list-of-names" {
  value = var.list-of-names
}


output "key-from-map" {
  value = lookup(local.countOfItems, "disks")
}