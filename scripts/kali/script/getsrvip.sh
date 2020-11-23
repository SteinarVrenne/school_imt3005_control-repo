#!/bin/bash
source /root/openRC.sh
var=$(openstack server list --sort-column Name | grep srv | awk '{print $9}')
prefix="iac_admin_net="
suffix=","
for i in $var
do
foo+=${i#"$prefix"}
foo+=','
done
foo=${foo%"$suffix"}
echo $foo
