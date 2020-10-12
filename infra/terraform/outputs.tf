output "rds_url" {
  value = module.db.this_db_instance_address
}

output "jenkins-public-ip" {
  value = aws_instance.jenkins-ec2.public_ip
}
