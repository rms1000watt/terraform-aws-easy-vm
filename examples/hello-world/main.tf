provider "aws" {
  region = "us-west-2"
}

data "aws_ssm_parameter" "ssh_password" {
  name = "ssh_password"
}

module "vm" {
  source = "../.."

  vpc_id       = "vpc-713e0914"
  subnet_id    = "subnet-7561172c"
  ssh_password = "${data.aws_ssm_parameter.ssh_password.value}"
}

output "public_ip" {
  value = "${module.vm.public_ip}"
}

output "public_dns" {
  value = "${module.vm.public_dns}"
}

output "ssh_cmd" {
  value = "${module.vm.ssh_cmd}"
}
