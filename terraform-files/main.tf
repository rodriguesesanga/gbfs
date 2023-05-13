resource "null_resource" "install_requirements_ooobeax" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python3", "-m", "pip3.10", "install", "--user", "-r"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python3"]
  }
}
