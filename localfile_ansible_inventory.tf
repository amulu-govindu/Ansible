resource "local_file" "ansible-inventory-file" {
  content = templatefile("publicservers.tpl",
    {

      testserver01    = aws_instance.docker-masters.0.public_ip
      testserver02    = aws_instance.docker-masters.1.public_ip
      testserver03    = aws_instance.docker-masters.2.public_ip
      pvttestserver01 = aws_instance.docker-workers.0.private_ip
      pvttestserver02 = aws_instance.docker-workers.1.private_ip
      pvttestserver03 = aws_instance.docker-workers.2.private_ip
    }
  )
  filename = "${path.module}/invfile"
}