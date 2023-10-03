output "elasticsearch_ips" {
  value = aws_instance.elasticsearch.*.public_ip
}

output "kibana_ip" {
  value = aws_instance.kibana.*.public_ip
}

output "fastapi_ip" {
  value = aws_instance.fastapi.*.public_ip
}

