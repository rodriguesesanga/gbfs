resource "null_resource" "install_requirements_q" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip3", "install", "-r"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
