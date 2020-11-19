#!/usr/bin/env python3

import subprocess, time, sys

# Number of the first ports used to run a docker container.

# In order to run a container. It has to increment the port value by 1, and take in the kali variant parameter
# runcontainer = subprocess.call('docker run -t -d --name kali4 -p' + str(port1++) +':5900 -p' + str(port2++) +':5901' kali #Kali should be "Pentest, Forensics or Stego"

# Print ut ip adressen til den nye maskinen som er laget, slik at web serveren kan hente dette via standard in/out
# echo laget dockercontainers ip:port

def send_ip(vnc, flavor):
    # Get srv IP
    allIp = str(subprocess.check_output('./script/getsrvip.sh')).lstrip("b'").rstrip("\\n'").split(",")
    port1 = 25901
    port2 = 25911
    num = 1
    leaveLoop = False
    newMachine = True
    for i in allIp:
        ipadd = str(i)
        for j in range(1, 11):
            try:
                port1 = int(str(subprocess.check_output("ssh root@"+ipadd+" docker port kali"+str(j)+" 5900", shell=True)).strip("0.0.0.0:"))
                port2 = int(str(subprocess.check_output("ssh root@"+ipadd+" docker port kali"+str(j)+" 5901", shell=True)).strip("0.0.0.0:"))
                val = subprocess.call("ssh root@" +ipadd+" docker port kali"+str(j)+" 5900", shell=True)
                num+=1
            except:
                newMachine = False
                leaveLoop = True
                break

        if leaveLoop == True:
            break

    if newMachine == True:
        # Start a new machine
        subprocess.call('../newHostMachine.sh srv'+str(len(allIp)+1), shell=True)
        sleep(10)
        allIp = str(subprocess.check_output('./getips.sh')).lstrip("b'").rstrip("\\n'").split(",")
        subprocess.call("ssh root@" +ipadd+" docker run -t -d --name kali"+str(num)+" -e vnc_passwd="+vnc+" -p "+str(port1)+":5900 -p "+str(port2)+":5901 "+flavor, shell=True)
        print(str(allip[-1])+":"+str(port2))
    else:
        port1 += 1
        port2 += 1
        subprocess.call("ssh root@" +ipadd+" docker run -t -d --name kali"+str(num)+" -e vnc_passwd="+vnc+" -p "+str(port1)+":5900 -p "+str(port2)+":5901 "+flavor, shell=True)
        print(ipadd+":"+str(port2))

if __name__ == "__main__":
    subprocess.call("source /root/openRC.sh")
    send_ip(str(sys.argv[1]), str(sys.argv[2]))