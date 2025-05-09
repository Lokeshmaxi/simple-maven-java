FROM openjdk:11

USER 65534
WORKDIR /opt
RUN mkdir -p /opt && chmod 755 /opt 
COPY --chmod=755    ./target/*.jar /opt/app.jar

RUN test -f /opt/app.jar && \
    echo "JAR exists" || (echo "JAR missing" && exit 1)

RUN ls -la /usr/local/openjdk-11/bin/java && \
    /usr/local/openjdk-11/bin/java -version
CMD ["java","-jar","/opt/app.jar"]