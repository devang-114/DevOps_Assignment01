FROM tomcat:8.0-alpine
MAINTAINER Devang Singh
RUN apk update
RUN apk add wget
RUN wget --user=admin --password=Password1234 -O /usr/local/tomcat/webapps/sampleapplication.war http://localhost:8082/ui/builds/DevOps-Assign01-pipeline/12/1616660908761/published/com.nagarro.firstapp:web-app:0.0.1-SNAPSHOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
