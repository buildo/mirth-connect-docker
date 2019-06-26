FROM openjdk:8-jre-alpine3.9

ENV MIRTH_CONNECT_VERSION 3.8.0.b2464

VOLUME /opt/mirth-connect/appdata

RUN \
  apk add --virtual deps curl && \
  cd /tmp && \
  curl -O https://s3.amazonaws.com/downloads.mirthcorp.com/connect/${MIRTH_CONNECT_VERSION}/mirthconnect-${MIRTH_CONNECT_VERSION}-unix.tar.gz && \
  tar xvzf mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  rm -f mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  mv Mirth\ Connect/* /opt/mirth-connect/ && \
  apk del deps

WORKDIR /opt/mirth-connect

CMD ["java", "-jar", "mirth-server-launcher.jar"]
