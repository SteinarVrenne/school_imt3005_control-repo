#!/bin/bash -v

export DEBIAN_FRONTEND=noninteractive

# Break if no input arguments
if [[ $# -eq 0 ]] ; then
    echo 'Missing server name!!!!!'
    exit 1
fi

# Source the config file
source /etc/puppetlabs/code/environments/production/scripts/iac_variables.conf

source /root/openRC.sh

command='openstack server create --image "'$image'" --flavor "'$flavor'" --security-group "'$linuxSecGroup'" --security-group "'$iacSecGroup'" --key-name "'$keyname'" --user-data /etc/puppetlabs/code/environments/production/scripts/host_machine_boot.sh '$1''

# echo $command

eval $command

openstack floating ip create ntnu-internal

findFloatingIP=$(openstack floating ip list | grep None | awk '{print $4}' | head -1)

addFloatingIP='openstack server add floating ip '$1' '$findFloatingIP

# echo $addFloatingIP

eval $addFloatingIP
