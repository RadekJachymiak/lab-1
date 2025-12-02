variable "server-name" {
  type        = string
  description = "Na0me of a server to provision"
}

output "out" {
  value = var.server-name
}