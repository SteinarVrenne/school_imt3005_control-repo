#!/bin/bash

docker run -t -d --name kali2 -e vnc_passwd=$0 -p 25901:5900 -p 25905:5901 boomer