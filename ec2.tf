# Define the EC2 instance resource
resource "aws_instance" "sbi_ec2_1" {
  ami           = "ami-04b6019d38ea93034"
  instance_type = "t2.micro"

  # Use the existing security group ID
  vpc_security_group_ids = ["sg-0e59e4c5e983a0cb1"]  

  tags = {
    Name = "Sbi_ec2_1"
  }

  # Optional: Add a key pair for SSH access
  key_name = "Singapore"  

  # Define the root block device settings
  root_block_device {
    volume_size = 8  # Volume size in GB
  }
}

# Output the instance's public IP
output "instance_public_ip_1" {
  value = aws_instance.sbi_ec2_1.public_ip
}
