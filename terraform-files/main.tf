resource "null_resource" "install_requirements_gbfs" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "-r"]
  }
}

resource "null_resource" "run_py_file_gbfs" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
