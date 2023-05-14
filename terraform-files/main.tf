resource "null_resource" "git_clone_sys_gbfs" {
  provisioner "local-exec" {
    command = "git clone https://github.com/MobilityData/gbfs.git"
  }
}

resource "null_resource" "copy_system_gbfs" {
  provisioner "local-exec" {
    command = "cp gbfs/systems.csv ../"
  }
}

resource "null_resource" "install_requirements_gbfs" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "-r"]
  }
}

resource "null_resource" "run_py_file_gbfs" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
}
