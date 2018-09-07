output "public_ip" {
  value = "${aws_instance.vm.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.vm.public_dns}"
}

output "ssh_cmd" {
  value = <<EOF
ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no ubuntu@${aws_instance.vm.public_ip}
EOF
}
