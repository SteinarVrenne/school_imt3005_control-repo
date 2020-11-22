#!/usr/bin/env python

import subprocess, sys
from time import sleep

# Number of the first ports used to run a docker container.

# In order to run a container. It has to increment the port value by 1, and take in the kali variant parameter
# runcontainer = subprocess.call('docker run -t -d --name kali4 -p' + str(port1++) +':5900 -p' + str(port2++) +':5901' kali #Kali should be "Pentest, Forensics or Stego"

# Print ut ip adressen til den nye maskinen som er laget, slik at web serveren kan hente dette via standard in/out
# echo laget dockercontainers ip:port
def start_new_container(port1, port2, ipadd, num, vnc, flavor):
    subprocess.call("ssh root@" +ipadd+" docker run -t -d --name kali"+str(num)+" -e vnc_passwd="+vnc+" -p "+str(port1)+":5900 -p "+str(port2)+":5901 "+flavor, shell=True)
    print(ipadd+":"+str(port2))

def send_ip(vnc, flavor):
    # Get srv IP
    allIp = str(subprocess.check_output('bash /etc/puppetlabs/code/environments/production/scripts/kali/script/getsrvip.sh', shell=True)).lstrip("b'").rstrip("\n'").split(",")
    print(allIp)
    leaveLoop = False
    newMachine = True
    for i in allIp:
        port1 = 25901
        port2 = 25911
        num = 1
        ipadd = str(i)
        for j in range(1, 11):
            try:
                port1 = int(str(subprocess.check_output("ssh root@"+ipadd+" docker port kali"+str(j)+" 5900", shell=True)).strip("0.0.0.0:"))
                port2 = int(str(subprocess.check_output("ssh root@"+ipadd+" docker port kali"+str(j)+" 5901", shell=True)).strip("0.0.0.0:"))
                val = subprocess.call("ssh root@" +ipadd+" docker port kali"+str(j)+" 5900", shell=True)
                num+=1
            except:
                leaveLoop = True
                if j == 10:
                    newMachine = True
                break
        if leaveLoop == True:
            break

    if newMachine == True:
        # Start a new machine
        subprocess.call('bash /etc/puppetlabs/code/environments/production/scripts/newHostMachine.sh srv'+str(len(allIp)+1), shell=True)
        sleep(10)
        allIp = str(subprocess.check_output('bash /etc/puppetlabs/code/environments/production/scripts/kali/script/getsrvip.sh', shell=True)).lstrip("b'").rstrip("\n'").split(",")
        start_new_container(25901, 25911, str(allip[-1]), num, vnc, flavor)
    else:
        port1 += 1
        port2 += 1
        start_new_container(port1,port2, ipadd, num, vnc, flavor)
    
if __name__ == "__main__":
    send_ip(str(sys.argv[1]), str(sys.argv[2]))