# OuiMaitre
OuiMaitre is my first container with docker

You could install a container with Apache Tomcat/9.0.0.M17 in Raspberry PI 3 Raspbian Jessie

# What is Tomcat?

Apache Tomcat (or simply Tomcat) is an open source web server and servlet container developed by the Apache Software Foundation (ASF). Tomcat implements the Java Servlet and the JavaServer Pages (JSP) specifications from Oracle, and provides a "pure Java" HTTP web server environment for Java code to run in. In the simplest config Tomcat runs in a single operating system process. The process runs a Java virtual machine (JVM). Every single HTTP request from a browser to Tomcat is processed in the Tomcat process in a separate thread.

> [wikipedia.org/wiki/Apache_Tomcat](https://en.wikipedia.org/wiki/Apache_Tomcat)

![logo](https://raw.githubusercontent.com/docker-library/docs/master/tomcat/logo.png)Logo &copy; Apache Software Fountation



#How to use this image

1 - docker pull ailgorbot/ouimaitre

2 - run a container with this command

docker run -d -p 8080:8080 -p 8009:8009 -v /opt/tomcat/webapps:/opt/tomcat/webapps ailgorbot/ouimaitre

3 - start tomcat with this command

docker exec -d <container name> /opt/tomcat9/bin/startup.sh

4 - to stop tomcat

docker exec -d <container name> /opt/tomcat9/bin/shutdown.sh








