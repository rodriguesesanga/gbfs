resource "null_resource" "create_virtual_env" {
  provisioner "local-exec" {
    command = "virtualenv"
    interpreter = ["python", "-m", "pip", "install"]
  }
}
resource "null_resource" "install_requirements" {
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
