#!/usr/bin/env bash

setupUbuntuDebian() {
  echo "Update DNS"
  echo "supersede domain-name-servers 8.8.8.8, 9.9.9.9;" | sudo tee -a /etc/dhcp/dhclient.conf &> /dev/null
  sudo ifdown eth0 && sudo ifup eth0

  echo "Updating password authentication"
  sed 's/PasswordAuthentication no/PasswordAuthentication yes/g' < /etc/ssh/sshd_config > __
  sudo mv __ /etc/ssh/sshd_config
  sudo chmod 644 /etc/ssh/sshd_config
  sudo chown 0:0 /etc/ssh/sshd_config

  echo "ubuntu:${ssh_password}" | chpasswd
  sudo service sshd restart
}

if uname -a | grep -iq 'ubuntu\|debian'; then setupUbuntuDebian; fi
