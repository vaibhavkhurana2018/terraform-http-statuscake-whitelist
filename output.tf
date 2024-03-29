locals {
  ssl_ips = ["162.243.141.135","107.170.235.240","104.236.163.90"]
  api_ips = ["${split("\n", chomp(data.http.list-txt.body))}"]
  ips     = ["${concat(local.api_ips, local.ssl_ips)}"]
}

output "ips" {
  description = "List of all StatusCake egress IPs appended with subnet"
  value       = ["${formatlist("%s/32", local.ips)}"]
}
