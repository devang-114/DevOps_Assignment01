FROM tomcat:8.0-alpine
MAINTAINER Devang Singh
RUN apk update
RUN apk add wget
RUN wget --user=admin --password=Monoshef@4963!! -O /usr/local/tomcat/webapps/sampleapplication.war http://172.29.176.1:8082/artifactory/dev.devops.assignment/com/nagarro/firstapp/web-app/0.0.1-SNAPSHOT/web-app-0.0.1-20210325.101027-2.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
