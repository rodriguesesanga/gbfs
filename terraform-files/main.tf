resource "null_resource" "install_requirements_ooop" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python3", "-m", "pip", "install", "-r", "--user"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python3"]
  }
}
