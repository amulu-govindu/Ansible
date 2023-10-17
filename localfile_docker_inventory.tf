resource "local_file" "docker-inventory" {
  content = templatefile("details.tpl",
    {

      master01 = aws_instance.docker-masters.0.public_ip
      master02 = aws_instance.docker-masters.1.public_ip
      master03 = aws_instance.docker-masters.2.public_ip
      worker01 = aws_instance.docker-workers.0.public_ip
      worker02 = aws_instance.docker-workers.1.public_ip
      worker03 = aws_instance.docker-workers.2.public_ip
    }
  )
  filename = "dockinvfile"
}