resource "null_resource" "git_clone_zoom" {
  provisioner "local-exec" {
    command = "git clone https://github.com/MobilityData/gbfs.git"
    interpreter = ["cmd"]
  }
}

resource "null_resource" "list_files_zoom" {
  provisioner "local-exec" {
    command = "ls"
  }
}

resource "null_resource" "list_aaa_zoom" {
  provisioner "local-exec" {
    command = "ls ../"
  }
}

resource "null_resource" "copy_system_zb_zoom" {
  provisioner "local-exec" {
    command = "cp gbfs/systems.csv ../"
  }
}

resource "null_resource" "install_python_requirements_zoom" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "--user", "-r"]
  }
}

resource "null_resource" "run_python_file_zoom" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
