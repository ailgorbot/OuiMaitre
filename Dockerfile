#Download base image debian armhf
FROM armhf/debian

MAINTAINER AilgorBot <ailgorbot@gmail.com>

# Update Repositories
RUN echo "deb http://archive.raspberrypi.org/debian/ jessie main" >> /etc/apt/sources.list.d/raspberrypi.list
RUN apt-get update
 
# Install dependencies
RUN apt-get install -y curl
RUN apt-get install -y unzip
RUN apt-get install -y build-essential
RUN apt-get install -y vim
RUN apt-get install -y wget
 

# Install java8
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get install oracle-java8-jdk


# Install tomcat9
RUN cd /opt

RUN wget http://www.us.apache.org/dist/tomcat/tomcat-9/v9.0.0.M17/bin/apache-tomcat-9.0.0.M17.tar.gz
RUN tar xzf apache-tomcat-9.0.0.M17.tar.gz
RUN mv apache-tomcat-9.0.0.M17 tomcat9
RUN rm apache-tomcat-9.0.0.M17.tar.gz
RUN rm -rf /var/lib/apt/lists/*
RUN ln -s jdk-8-oracle-arm32-vfp-hflt /usr/lib/jvm/java-8-oracle


RUN echo 'export CATALINA_HOME='/opt/tomcat9'' >> /etc/environment
ENV CATALINA_HOME /opt/tomcat9

RUN echo 'export JAVA_HOME='/usr/lib/jvm/java-8-oracle'' >> /etc/environment
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN echo 'export JRE_HOME='/usr/lib/jvm/java-8-oracle/jre'' >> /etc/environment
ENV JRE_HOME /usr/lib/jvm/java-8-oracle/jre

RUN source ~/.bashrc

RUN cp /opt/tomcat9/conf/tomcat-users.xml /opt/tomcat9/conf/tomcat-users.ori
COPY tomcat-users.xml /opt/tomcat9/conf/tomcat-users.xml

# standard clean operations
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#expose ports
EXPOSE 8080
EXPOSE 8009

# add volume for webapps folder
VOLUME /opt/tomcat/webapps

#start tomcat
CMD ["/opt/tomcat9/bin/startup.sh"]