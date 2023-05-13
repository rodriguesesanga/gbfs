resource "null_resource" "git_clone" {
  provisioner "local-exec" {
    command = "git clone git@github.com:MobilityData/gbfs.git"
  }
}

resource "null_resource" "list_files" {
  provisioner "local-exec" {
    command = "ls"
  }
}

resource "null_resource" "installing_requirements_gbfs_" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "--user", "-r"]
  }
}

resource "null_resource" "execfile" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
