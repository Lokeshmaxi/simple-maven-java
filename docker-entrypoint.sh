#!/usr/bin/env sh

eval set -- -Djava.security.egd=file:/dev/./urandom ${JAVA_OPTS} ${JAVA_AGENT_OPTS} ${JAVA_AGENT} -jar /opt/app.jar

java "$@"
