resource "null_resource" "install_requirements_kka" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["py.exe", "-m", "pip", "install", "--user", "-r"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["py.exe"]
  }
}
