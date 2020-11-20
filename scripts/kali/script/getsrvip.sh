#!/bin/bash
source /home/ubuntu/openRC.sh
var=$(openstack server list | grep srv | awk '{print $9}')
prefix="iac_admin_net="
suffix=","
for i in $var 
do
foo+=${i#"$prefix"}
foo+=','
done
foo=${foo%"$suffix"}
echo $foo
