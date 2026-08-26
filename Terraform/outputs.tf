output "public_ip" {

  description = "Public IP address of the EC2 web server"

  value = aws_instance.web.public_ip

}



output "public_dns" {

  description = "Public DNS name of the EC2 web server"

  value = aws_instance.web.public_dns

}



output "website_url" {

  description = "HTTP address of the static website"

  value = "http://${aws_instance.web.public_ip}"

}



output "ssh_command" {

  description = "SSH command for connecting to the EC2 instance"

  value = "ssh -i ~/.ssh/callum-devops ec2-user@${aws_instance.web.public_ip}"

}
