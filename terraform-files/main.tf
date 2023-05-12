resource "null_resource" "install_virtualenv_modules" {
  provisioner "local-exec" {
    command = "virtualenv"
    interpreter = ["python", "-m"]
  }
}
resource "null_resource" "create_virtualenv_" {
  provisioner "local-exec" {
    command = "../venv"
    interpreter = ["python", "-m", "virtualenv"]
  }
}

resource "null_resource" "activate_virtualenv_" {
  provisioner "local-exec" {
    command = "source ../venv/Scripts/activate"
  }
}

resource "null_resource" "install_requirements_modules" {
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
