# Build sage-6.4.1 from source, and put it in a container
from ubuntu
# Based on github:swenson/docker-sage
maintainer Gissehel <public-docker-sagemath@gissehel.org>

# base ubuntu stuff
run echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list && \
 apt-get update && \
 apt-get upgrade -y && \
 apt-get install -y build-essential ca-certificates m4 curl && \
 adduser --disabled-password --gecos "" sage && \
 cd /home/sage/ && \
 sudo -u sage -H curl -Lso /tmp/sage.tar.gz http://boxen.math.washington.edu/home/sagemath/sage-mirror/src/sage-6.4.1.tar.gz && \
 sudo -u sage -H tar xvzf /tmp/sage.tar.gz && \
 rm -f /tmp/sage.tar.gz && \
 cd sage-6.4.1 && \
 sudo -u sage -H make && \
 sudo -u sage -H /home/sage/sage-6.4.1/sage -c 'quit()'
cmd []
entrypoint ["sudo","-u","sage","-H","/home/sage/sage-6.4.1/sage"]

