#!/bin/bash
 
# Update Repositories
apt-get update
 
# Install dependencies
apt-get install -y curl
apt-get install -y unzip
apt-get install -y build-essential
apt-get install -y vim
 

# Install java8
apt-get install oracle-java8-jdk

# Install tomcat9
cd /opt

wget http://www.us.apache.org/dist/tomcat/tomcat-9/v9.0.0.M8/bin/apache-tomcat-9.0.0.M8.tar.gz
tar xzf apache-tomcat-9.0.0.M8.tar.gz

mv apache-tomcat-9.0.0.M8 tomcat9

echo 'export CATALINA_HOME='/opt/tomcat9'' &gt;&gt; /etc/environment
echo 'export JAVA_HOME='/usr/lib/jvm/java-8-oracle'' &gt;&gt; /etc/environment
echo 'export JRE_HOME='/usr/lib/jvm/java-8-oracle/jre'' &gt;&gt; /etc/environment
source ~/.bashrc



# Start
cd /opt/tomcat9
./bin/startup.sh 
