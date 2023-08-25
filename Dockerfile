FROM adoptopenjdk/openjdk8:alpine-jre
COPY target/*.jar  /opt/app.jar

WORKDIR /opt
# Open Tomcat port
EXPOSE 8080
USER 65534
# Start App
CMD ["java","-jar","/opt/app.jar"]