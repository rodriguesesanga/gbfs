resource "null_resource" "install_requirements_o" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "-r"]
  }
}

resource "null_resource" "install_requirements_p" {
  provisioner "local-exec" {
    command = "boto3"
    interpreter = ["python", "-m", "pip", "install"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
