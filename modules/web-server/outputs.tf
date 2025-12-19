output "server_ip" {
  # value = aws_instance.app_server[*].public_ip
  # value = aws_instance.app_server[*].tags("Name")
    value = formatlist(
        "Machin with name: %s has public ip %s",
        aws_instance.app_server[*].tags["Name"],
        aws_instance.app_server[*].public_ip,
    )
}