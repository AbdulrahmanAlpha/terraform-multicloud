# modules/aws_vm/main.tf

# Creates a single AWS EC2 instance.
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  tags = merge(var.common_tags, {
    Name = "${var.prefix}-app-server"
    Role = "Web-Server"
  })
}
