#!/bin/bash
 
# Update Repositories
echo "deb http://archive.raspberrypi.org/debian/ jessie main" >> /etc/apt/sources.list.d/raspberrypi.list
apt-get update
 
# Install dependencies
apt-get install -y curl
apt-get install -y unzip
apt-get install -y build-essential
apt-get install -y vim
apt-get install -y wget
 

# Install java8
apt-get update
apt-get install oracle-java8-jdk


# Install tomcat9
cd /opt

wget http://www.us.apache.org/dist/tomcat/tomcat-9/v9.0.0.M17/bin/apache-tomcat-9.0.0.M17.tar.gz
tar xzf apache-tomcat-9.0.0.M17.tar.gz
mv apache-tomcat-9.0.0.M17 tomcat9
rm apache-tomcat-9.0.0.M17.tar.gz
rm -rf /var/lib/apt/lists/*
ln -s jdk-8-oracle-arm32-vfp-hflt /usr/lib/jvm/java-8-oracle


echo 'export CATALINA_HOME='/opt/tomcat9'' >> /etc/environment
export CATALINA_HOME='/opt/tomcat9'

echo 'export JAVA_HOME='/usr/lib/jvm/java-8-oracle'' >> /etc/environment
export JAVA_HOME='/usr/lib/jvm/java-8-oracle'

echo 'export JRE_HOME='/usr/lib/jvm/java-8-oracle/jre'' >> /etc/environment
export JRE_HOME='/usr/lib/jvm/java-8-oracle/jre'

source ~/.bashrc

cp /opt/tomcat9/conf/tomcat-users.xml /opt/tomcat9/conf/tomcat-users.ori


#<pre><!-- user manager can access only manager section -->
#<role rolename="manager-gui" />
#<user username="manager" password="_SECRET_PASSWORD_" roles="manager-gui" />
# 
#<!-- user admin can access manager and admin section both -->
#<role rolename="admin-gui" />
#<user username="admin" password="_SECRET_PASSWORD_" roles="manager-gui,admin-gui" /></pre>



# Start
cd /opt/tomcat9
./bin/startup.sh 


/bin/bash /opt/tomcat9//bin/startup.sh