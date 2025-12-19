terraform {
  required_version = "~>1.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.25.0"
    }
  }
}

module "web_server" {
  source = "./modules/web-server"
  server_version = 1
  number_of_servers = 4
}

output "servers" {
  value = module.web_server.server_ip
}