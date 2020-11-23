#!/bin/bash -v
# CREATES a config file. Edit variables here for your own named keys other variables you want to change

export DEBIAN_FRONTEND=noninteractive

# Source the .rc file
source /root/openRC.sh

# Touch the file to create it if it does not exist
touch /etc/puppetlabs/code/environments/production/scripts/iac_variables.conf

# Automatically added by the HEAT repo, should not be changed
linuxSecGroup=$(openstack security group list | grep project-sec_group_linux | awk '{print $4}' )

iacSecGroup=$(openstack security group list | grep project-sec_group_iac | awk '{print $4}' ) 

networkname="iac_admin_net"

# Should be altered on per project basis. Create a key name in OpenStack and copy the name in here
keyname="group4key"

# Image name, we prefer Ubuntu 18.04 
image="Ubuntu Server 18.04 LTS (Bionic Beaver) amd64"

# Default flavor of container host machines. Can and should be changed depending on allotted resources
flavor="m1.large"

declare -p linuxSecGroup iacSecGroup networkname keyname image flavor > /etc/puppetlabs/code/environments/production/scripts/iac_variables.conf