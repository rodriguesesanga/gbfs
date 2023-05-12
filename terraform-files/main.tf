resource "null_resource" "install_requirements_f" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "-r"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
