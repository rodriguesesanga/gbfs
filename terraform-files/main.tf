resource "null_resource" "execfile" {
  provisioner "local-exec" {
    #command = "echo ${self.private_ip} >> private_ips.txt"
    command = "python main.py"
    interpreter = ["python"]
  }
}
