resource "aws_s3_bucket" "tf_tutorial" {
  #parameters/arguments for the resource and unique name for bucket
  bucket = "gbfs-bucket"
  acl	 = "private"
}

resource "null_resource" "gbfs-exec" {
  provisioner "local-scripts" {
    command = "main.py"
    interpreter = ["python"]
  }
}
