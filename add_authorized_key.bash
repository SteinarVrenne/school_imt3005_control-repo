#!/bin/bash -v

export DEBIAN_FRONTEND=noninteractive

# Source openstack .rc file so we can contact the OpenStack API with our projects credentials
source /root/openRC.sh

webip=$(openstack server list | grep web | awk '{print $9}')

# SSH to webserver and generate key
ssh -oStrictHostKeyChecking=no root@$webip "ssh-keygen -q -N '' -f /root/.ssh/id_rsa"

# cat the file contents and add to ubuntu's authorized key on manager
ssh root@$webip "cat /root/.ssh/id_rsa.pub" >> /home/ubuntu/.ssh/authorized_keys
