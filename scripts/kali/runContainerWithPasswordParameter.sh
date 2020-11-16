#!/bin/bash

<<<<<<< HEAD
docker run -t -d --name kali2 -e vnc_passwd="$0" -p 25901:5900 -p 25905:5901 boomer
=======
docker run -t -d --name kali2 -e vnc_passwd=$1 -p 25901:5900 -p 25905:5901 kali-13-10
>>>>>>> 133ad63 (Deleted varaible.sh script, and some small changes to the run container script)
