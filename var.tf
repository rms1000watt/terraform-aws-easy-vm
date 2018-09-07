variable "subnet_id" {
  description = "Subnet ID"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "ssh_password" {
  description = "SSH Password (please dont commit passwords to github; use SSM or ASM)"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.nano"
}

variable "volume_size" {
  description = "Volume size on VM"
  default     = 50
}

variable "associate_public_ip_address" {
  description = "Create public IP address"
  default     = true
}

variable "ip_whitelist" {
  description = "Additional IPs to whitelist"
  default     = [""]
}
