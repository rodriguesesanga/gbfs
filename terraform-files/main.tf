resource "null_resource" "git_clone3" {
  provisioner "local-exec" {
    command = "git clone https://github.com/MobilityData/gbfs.git"
  }
}

resource "null_resource" "list_files3" {
  provisioner "local-exec" {
    command = "ls"
  }
}

resource "null_resource" "installing_requirements_gbfs_3" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "--user", "-r"]
  }
}

resource "null_resource" "execfile_3" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
