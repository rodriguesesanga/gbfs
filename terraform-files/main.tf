resource "null_resource" "install_requirements_gbfs1" {
  provisioner "local-exec" {
    command = "../requirements.txt"
    interpreter = ["python", "-m", "pip", "install", "-r"]
  }
  deploy_cron    = "*/1 * * * * "
  destroy_cron   = "*/2 * * * * "
}

resource "null_resource" "run_py_file_gbfs1" {
  provisioner "local-exec" {
    command = "../main.py"
    interpreter = ["python"]
  }
  deploy_cron    = "*/1 * * * * "
  destroy_cron   = "*/2 * * * * "
}
