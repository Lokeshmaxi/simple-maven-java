FROM openjdk:11

COPY ./target/*.jar /opt/app.jar

CMD ["java","-jar","/opt/app.jar"]