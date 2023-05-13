resource "null_resource" "install_requirements_kka" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["Python", "-m", "pip", "install", "--user", "-r"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
