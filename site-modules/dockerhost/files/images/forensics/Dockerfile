FROM kali_base
ENV DEBIAN_FRONTEND="noninteractive"

RUN apt update

RUN apt-get install -y binutils binwalk wireshark foremost dc3dd maltego suricata telnet

# Installs AccessData FTK imager
#RUN wget "https://ad-zip.s3.amazonaws.com/ftkimager.3.1.1_ubuntu64.tar.gz" \
#    && tar -xf ftkimager.3.1.1_ubuntu64.tar.gz \
#    && chmod +x ftkimager \
#    && mv ftkimager /usr/local/bin/

# Autopsy
#RUN apt install libafflib-dev libbfio-dev libc3p0-java libewf-dev libpostgresql-jdbc-java sleuthkit-java
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt install oracle-java8-installer
#RUN update-alternatives --config java
#RUN echo 'JAVA_HOME="/opt/jdk1.8.0_101"' >> /etc/environment
#RUN export JAVA_HOME
#RUN source /etc/environment
#RUN mkdir /home/ubuntu/autopsy-4.6.0-linux
#RUN cd /home/ubuntu/autopsy-4.6.0-linux/
#RUN wget -nc -cq https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.6.0-linux1/sleuthkit-java_4.6.0-1_amd64.deb
#RUN wget -nc -cq --show-progress https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.6.0-linux1/autopsy-4.6.0-linux1.zip
#RUN dpkg -x sleuthkit-java_4.6.0-1_amd64.deb sleuthkit
#RUN cp -r sleuthkit/usr/* /usr/
#RUN mkdir autopsy-4.6.0-linux
#RUN unzip autopsy-4.6.0-linux1.zip -d autopsy-4.6.0-linux
#RUN    cd autopsy-4.6.0-linux/
#RUN    chmod +x unix_setup.sh
#RUN    ./unix_setup.sh
