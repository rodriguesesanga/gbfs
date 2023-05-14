resource "null_resource" "git_clone_zb" {
  provisioner "local-exec" {
    command = "git clone https://github.com/MobilityData/gbfs.git"
  }
}

resource "null_resource" "list_files" {
  provisioner "local-exec" {
    command = "ls"
  }
}

resource "null_resource" "list_aaa" {
  provisioner "local-exec" {
    command = "ls ../"
  }
}

resource "null_resource" "copy_system_zb" {
  provisioner "local-exec" {
    command = "cp gbfs/systems.csv ../"
  }
}

resource "null_resource" "install_python_requirements1zb" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "--user", "-r"]
  }
}

resource "null_resource" "run_python_file1" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
