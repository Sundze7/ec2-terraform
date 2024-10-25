resource "aws_instance" "web" {
  ami                    = "ami-0ea3c35c5c3284d82"  
  instance_type          = "t2.medium"
  key_name               = "stellahtech"
  vpc_security_group_ids = [aws_security_group.new-sg.id]
  # user_data              = templatefile("./install.sh", {})
  user_data = <<-EOT
    #!/bin/bash
    sudo apt update
    sudo apt install -y nginx
    sudo systemctl start nginx
  EOT 

  tags = {
    Name = "docker-sonar"
  }

#   root_block_device {
#     volume_size = 30
#   }
}

output "ec2_public_dns" {
  value = aws_instance.web.public_dns
}



# resource "aws_instance" "github-runner" {
#   ami = "ami-0ea3c35c5c3284d82"
#   instance_type = "t2.medium"
#   key_name = "stellatech"
#   vpc_security_group_ids = [aws_security_group.new-sg.id]
#   user_data = templatefile("./github-runner.sh", {
#     github_token = var.github_token
#     github_repo = var.github_repo

#   })

#   tags = {
#     Name = "github-runner"
#   }
# }

resource "aws_security_group" "new-sg" {
  name        = "new-sg"
  description = "Allow TLS inbound traffic"

  ingress = [
    for port in [22, 80, 443, 8080, 9000, 4954] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "new-sg"
  }
}
