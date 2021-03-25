FROM tomcat:8.0-alpine
MAINTAINER Devang Singh
RUN apk update
RUN apk add wget
RUN wget --user=admin --password=Password1234 -O /usr/local/tomcat/webapps/sampleapplication.war http://localhost/artifactory/dev.devops.assignment/com/nagarro/firstapp/web-app/0.0.1-SNAPSHOT/web-app-0.0.1-20210325.082757-4.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
