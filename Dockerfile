
FROM tomcat:latest
LABEL maintainer="Devang Singh"
COPY target/SampleWebApp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
