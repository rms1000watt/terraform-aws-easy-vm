data "template_file" "0" {
  template = "${file("${path.module}/userdata.sh")}"

  vars {
    ssh_password = "${var.ssh_password}"
  }
}
