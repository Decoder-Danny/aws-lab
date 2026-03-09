output "web_server_access_url" {
  value = "http://${module.compute.public_ip}"
}