# data "aws_ami" "my_ami" {
#      most_recent      = true
#      name_regex       = "^DevSecOps"
#      owners           = ["self"]
# }


resource "aws_instance" "docker-masters" {
  count                       = 3
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = lookup(var.instance_type, local.new_environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name              = "${var.vpc_name}-MastertNode-${count.index + 1}"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
  }
}

resource "aws_instance" "docker-workers" {
  count                       = 3
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = lookup(var.instance_type, local.new_environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name              = "${var.vpc_name}-WorkerNode-${count.index + 1}"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
  }
}
