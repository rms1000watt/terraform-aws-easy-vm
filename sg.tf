module "sg" {
  source  = "rms1000watt/easy-sg/aws"
  version = "0.2.0"

  vpc_id    = "${var.vpc_id}"
  whitelist = ["${var.ip_whitelist}"]
}
