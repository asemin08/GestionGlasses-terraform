output "out_eip_public_ip" {
  value = aws_eip.ip_public.public_ip
}

output "out_eip_id" {
  value = aws_eip.ip_public.id
}