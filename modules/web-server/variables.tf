variable "number_of_servers" {
  type = number
  default = 2
}


variable "name_prefix" {
  type    = string
  default = "awsninja3"
}

variable "server_version" {
  type = string
  validation {
    condition     = var.server_version == "1" || var.server_version == "2"
    error_message = "wrong version"
  }
}