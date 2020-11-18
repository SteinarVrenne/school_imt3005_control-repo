#!/usr/bin/env python3

import subproces, time, sys

# Get srv IP
allIp = str(subprocess.check_output('./getips.sh')).lstrip("b'").rstrip("\\n'").split(",")

# Get amount of containers in srv1
#containers = []
#for i in allIp:
#    containers.append(subprocess.getoutput('ssh root@' +str(i)' docker ps -a | wc -l'))

# Number of the first ports used to run a docker container.

# In order to run a container. It has to increment the port value by 1, and take in the kali variant parameter
# runcontainer = subprocess.call('docker run -t -d --name kali4 -p' + str(port1++) +':5900 -p' + str(port2++) +':5901' kali #Kali should be "Pentest, Forensics or Stego"

# getports = str(subprocess.call("docker ps | awk '{print $10, $11}'", shell=True)).split("tcp")

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
        newmachine = subprocess.run('blablabla start srv3...')
        sleep(10)
        allIp = str(subprocess.check_output('./getips.sh')).lstrip("b'").rstrip("\\n'").split(",")
        subprocess.call("docker run -t -d --name kali"+str(num)+" -e vnc_passwd="+vnc+" -e flavour="+flavor+" -p "+str(port1)+":5900 -p "+str(port2)+":5901 kali", shell=True)
        print(str(allip[-1])+":"+str(port2))
    else:
        port1 += 1
        port2 += 1
        subprocess.call("docker run -t -d --name kali"+str(num)+" -e vnc_passwd="+vnc+" -e flavour="+flavor+" -p "+str(port1)+":5900 -p "+str(port2)+":5901 kali", shell=True)
        print(ipadd+":"+str(port2))



# Check if the server has the correct docker images, run this script
# buildContainers.sh


# If srv1 has more or less than 10 containers
if containers < 10:
    # If number is less than 10, then run a new container from the variable runcontainer.
    subprocess.call("docker run -t -d --name kali1 -p 25902:5900 -p 25912:5901 kali", shell=True)
   # Pseudokode for implementering av variabler
   subprocess.call("docker run -t -d --name kali$number -e vnc_passwd=$arg1 -e flavour=$arg2 -p $port1:5900 -p $port2:5901 kali", shell=True)

else:
    # Else chech how many containers there are no server 2. If server 2 is not present, create it
     containers = subprocess.getoutput('ssh ubuntu@' +str(server2ip)' -i gruppe4.pem docker ps -a | wc -l')


if __name__ == __main__:
    send_ip(str(sys.argv[1]), str(sys.argv[2]))

# Print ut ip adressen til den nye maskinen som er laget, slik at web serveren kan hente dette via standard in/out
# echo laget dockercontainers ip:port
