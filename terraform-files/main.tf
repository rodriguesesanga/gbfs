resource "null_resource" "requirements" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "-r"]
  }
}

resource "null_resource" "check_pip" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "freeze"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
