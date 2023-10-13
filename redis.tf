resource "aws_instance" "Redisserver" {
  //count                       = local.new_environment == "production" ? 1 : 1
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = "t2.medium"
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public-subnets.0.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name              = "Redisserver"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
  }
}
