resource "null_resource" "requirements" {
  provisioner "local-exec" {
    #command = "echo ${self.private_ip} >> private_ips.txt"
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    #command = "echo ${self.private_ip} >> private_ips.txt"
    command = "../main.py"
    interpreter = ["python"]
  }
}
