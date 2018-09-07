resource "aws_instance" "vm" {
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  ami                         = "${data.aws_ami.0.id}"
  user_data                   = "${data.template_file.0.rendered}"

  vpc_security_group_ids = ["${module.sg.id}"]
  subnet_id              = "${var.subnet_id}"

  root_block_device {
    volume_size = "${var.volume_size}"
    volume_type = "gp2"
  }

  lifecycle {
    ignore_changes = [
      "user_data",
    ]
  }
}
