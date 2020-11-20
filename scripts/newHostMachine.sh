#!/bin/bash -v

export DEBIAN_FRONTEND=noninteractive

# Source the config file
source ./iac_variables.conf

source /root/openRC.sh

command='openstack server create --image "'$image'" --flavor "'$flavor'" --security-group "'$linuxSecGroup'" --security-group "'$iacSecGroup'" --key-name "'$keyname'" --user-data "/etc/puppetlabs/code/environments/production/scripts/host_machine_boot.sh" '$1''

# echo $command

eval $command
