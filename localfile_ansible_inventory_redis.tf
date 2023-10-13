resource "local_file" "localfile_ansible_inventory_redis" {
  content = templatefile("publicservers-redis.tpl",
    {

      Redisserver = aws_instance.Redisserver.public_ip

    }
  )
  filename = "${path.module}/redisinvfile"

}