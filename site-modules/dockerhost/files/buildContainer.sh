#!/bin/bash
docker pull haraldaarz/kali_xfce_vnc_top10
docker build -t kali_base ./images/kali_base

# Builds the pentest image
docker build -t pentest ./images/pentest

# Builds the forensics image
docker build -t forensics ./images/forensics


# Builds the stego image
docker build -t stego ./images/stego
