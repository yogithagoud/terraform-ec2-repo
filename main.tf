provider "aws" {
  region     = "ap-southeast-1"
  access_key = ""
  secret_key = ""
}

#Create security group with firewall rules
resource "aws_security_group" "my_security_group" {
  name        = var.security_group
  description = "security group for Ec2 instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # User data script to run at instance launch
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install docker -y
              sudo usermod -aG docker ec2-user
              sudo systemctl enable docker.service
              sudo systemctl start docker.service
              docker run -itd -p 8085:8080 kalithkarrahul/webapp:1.0 
              echo "Welcome to Jenkins Provisioned EC2. Your application is up and running!"
              EOF

  tags= {
    Name = var.security_group
  }
}

# Create AWS ec2 instance
resource "aws_instance" "myFirstInstance" {
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  security_groups= [var.security_group]
  tags= {
    Name = var.tag_name
  }
}
