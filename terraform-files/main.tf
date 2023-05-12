resource "null_resource" "requirements" {
  provisioner "local-exec" {
    #command = "echo ${self.private_ip} >> private_ips.txt"
    command = "-m pip install ../requirements.txt"
    interpreter = ["python"]
  }
}
resource "null_resource" "execfile" {
  provisioner "local-exec" {
    #command = "echo ${self.private_ip} >> private_ips.txt"
    command = "../main.py"
    interpreter = ["python"]
  }
}
