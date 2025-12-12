output "instance_id" {
  value       = aws_instance.ec2.id
  description = "EC2 instance ID"
}
output "public_ip" {
  value       = aws_instance.ec2.public_ip
  description = "Public IP address of the instance"
}
output "public_dns" {
  value       = aws_instance.ec2.public_dns
  description = "Public DNS of the instance"
}