# Define the EC2 instance resource
resource "aws_instance" "sbi_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Use the existing security group ID
  vpc_security_group_ids = [var.security_group]  

  # User data script to run at instance launch
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install docker -y
              sudo usermod -aG docker ec2-user
              sudo systemctl enable docker.service
              sudo systemctl start docker.service
              docker run -itd -p 8086:8080 yogitha8184/application:1.5
              echo "Welcome to Jenkins Provisioned EC2. Your application is up and running!"
              EOF

  tags = {
    Name = "Sbi_ec2"
    environment = "Dev"
  }

  # Optional: Add a key pair for SSH access
  key_name = var.key_name  

  # Define the root block device settings
  root_block_device {
    volume_size = 8  # Volume size in GB
  }
}
