#!/bin/bash -v

export DEBIAN_FRONTEND=noninteractive

webip=$(openstack server list | grep web | awk '{print $9}')

# SSH to webserver
ssh root@$webip "ssh-keygen -q -N '' -f /root/.ssh/id_rsa"

# cat the file contents and add to ubuntu's authorized key
ssh root@$webip "cat /root/.ssh/id_rsa.pub" >> /home/ubuntu/.ssh/authorized_keys
