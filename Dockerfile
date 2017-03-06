#Download base image debian armhf
FROM armhf/debian

MAINTAINER AilgorBot <ailgorbot@gmail.com>

COPY configure.sh /opt
 
RUN chmod 755 /opt/configure.sh
 
CMD ["/opt/configure.sh"]
