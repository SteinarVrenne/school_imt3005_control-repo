#!/usr/bin/env python3

import subproces, time, sys

# Get srv IP
allIp = str(subprocess.check_output('./getips.sh')).lstrip("b'").rstrip("\\n'").split(",")

# Number of the first ports used to run a docker container.

# In order to run a container. It has to increment the port value by 1, and take in the kali variant parameter
# runcontainer = subprocess.call('docker run -t -d --name kali4 -p' + str(port1++) +':5900 -p' + str(port2++) +':5901' kali #Kali should be "Pentest, Forensics or Stego"

# Print ut ip adressen til den nye maskinen som er laget, slik at web serveren kan hente dette via standard in/out
# echo laget dockercontainers ip:port

def send_ip(vnc, flavor):
port1 = 25901
port2 = 25911
ipadd = ""
num = 1
newMachine = True
    for i in allIp:
        ipadd = allIp[i]
        for j in range(1, 11):
            port1 = int(str(subprocess.check_output("ssh root@"+ipadd+" docker port kali"+str(j)+" 5900", shell=True)).strip("0.0.0.0:"))
            port2 = int(str(subprocess.check_output("ssh root@"+ipadd+" docker port kali"+str(j)+" 5901", shell=True)).strip("0.0.0.0:"))
            val = subprocess.call("ssh root@" +str(i)" docker port kali"+str(j)+" 5900", shell=True)
            if val == "1":
                newMachine = False
                var = j
                break
    if newMachine == True:
        # Start a new machine
        subprocess.call('../newHostMachine.sh')
        sleep(10)
        allIp = str(subprocess.check_output('./getips.sh')).lstrip("b'").rstrip("\\n'").split(",")
        subprocess.call("docker run -t -d --name kali"+str(num)+" -e vnc_passwd="+vnc+" -e flavour="+flavor+" -p "+str(port1)+":5900 -p "+str(port2)+":5901 kali", shell=True)
        print(str(allip[-1])+":"+str(port2))
    else:
        port1 += 1
        port2 += 1
        subprocess.call("docker run -t -d --name kali"+str(num)+" -e vnc_passwd="+vnc+" -e flavour="+flavor+" -p "+str(port1)+":5900 -p "+str(port2)+":5901 kali", shell=True)
        print(ipadd+":"+str(port2))

if __name__ == __main__:
    send_ip(str(sys.argv[1]), str(sys.argv[2]))


