resource "null_resource" "installing_requirements_gbfs" {
  schedule         = "*/1 * * * *"
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "--user", "-r"]
  }
}

resource "null_resource" "execfile" {
  schedule         = "*/8 * * * *"
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
