resource "null_resource" "git_clone1" {
  provisioner "local-exec" {
    command = "git clone https://github.com/MobilityData/gbfs.git"
  }
}

resource "null_resource" "list_files1" {
  provisioner "local-exec" {
    command = "ls"
  }
}

resource "null_resource" "installing_requirements_gbfs_1" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "--user", "-r"]
  }
}

resource "null_resource" "execfile1" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
