output "ec2_public_dns" {
  value = aws_instance.web.public_dns
}
