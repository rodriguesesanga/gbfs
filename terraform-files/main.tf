resource "null_resource" "requirements" {
  provisioner "local-exec" {
    #command = "echo ${self.private_ip} >> private_ips.txt"
    command = "pip install ../requirements.txt"
    interpreter = ["python", "-m"]
  }
}
resource "null_resource" "execfile" {
  provisioner "local-exec" {
    #command = "echo ${self.private_ip} >> private_ips.txt"
    command = "../main.py"
    interpreter = ["python"]
  }
}
