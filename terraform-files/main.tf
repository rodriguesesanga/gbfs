resource "null_resource" "install_requirements_ooo" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python3", "-m", "pip", "install", "-r"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python3"]
  }
}
