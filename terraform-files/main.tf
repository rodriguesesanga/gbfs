resource "null_resource" "git_clone_systems1" {
  provisioner "local-exec" {
    command = "git clone https://github.com/MobilityData/gbfs.git"
    interpreter = ["bash"]
  }
}

resource "null_resource" "copy_system_in_root1" {
  provisioner "local-exec" {
    command = "cp gbfs/systems.csv ../"
  }
}

resource "null_resource" "install_python_requirements1" {
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
