#!/usr/bin/env python

import subprocess, sys
from time import sleep

# Number of the first ports used to run a docker container.

# In order to run a container. It has to increment the port value by 1, and take in the kali variant parameter
# runcontainer = subprocess.call('docker run -t -d --name kali4 -p' + str(port1++) +':5900 -p' + str(port2++) +':5901' kali #Kali should be "Pentest, Forensics or Stego"

# Print ut ip adressen til den nye maskinen som er laget, slik at web serveren kan hente dette via standard in/out
# echo laget dockercontainers ip:port
def start_new_container(port1, port2, ipadd, num, vnc, flavor):
    port1 += 1
    port2 += 1
    subprocess.call("ssh -o StrictHostKeyChecking=no root@" +ipadd+" docker run -t -d --name kali"+str(num)+" -e vnc_passwd="+vnc+" -p "+str(port1)+":5900 -p "+str(port2)+":5901 "+flavor, shell=True)
    sleep(2)
    print(ipadd+":"+str(port2))

def send_ip(vnc, flavor):
    # Get srv IP
    allIp = str(subprocess.check_output('bash /etc/puppetlabs/code/environments/production/scripts/kali/script/getsrvip.sh', shell=True)).lstrip("b'").rstrip("\n'").split(",")
    leaveLoop = False
    newMachine = False
    for i in allIp:
        port1 = 25900
        port2 = 25910
        num = 1
        ipadd = str(i)
        for j in range(1, 11):
            try:
                port1 = int(str(subprocess.check_output("ssh -o StrictHostKeyChecking=no root@"+ipadd+" docker port kali"+str(j)+" 5900", shell=True)).strip("0.0.0.0:"))
                port2 = port1 + 10
                num+=1
            except:
                leaveLoop = True
                if j == 8:
                    newMachine = True
                break
        if leaveLoop == True:
            break
            
    if newMachine == True:
        # Start a new machine
        start_new_container(port1, port2, ipadd, num, vnc, flavor)
        subprocess.call('bash /etc/puppetlabs/code/environments/production/scripts/newHostMachine.sh srv'+str(len(allIp)+1) + ' > /dev/null', shell=True)
    else:
        start_new_container(port1,port2, ipadd, num, vnc, flavor)

if __name__ == "__main__":
    send_ip(str(sys.argv[1]), str(sys.argv[2]))
