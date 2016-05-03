FROM lolhens/baseimage-oracle-jdk:latest
MAINTAINER LolHens <pierrekisters@gmail.com>

ENV ARTIFACTORY_VERSION 4.7.5
ENV ARTIFACTORY_NAME artifactory-oss-$ARTIFACTORY_VERSION
ENV ARTIFACTORY_FILE jfrog-$ARTIFACTORY_NAME.zip
ENV ARTIFACTORY_URL https://bintray.com/artifact/download/jfrog/artifactory/$ARTIFACTORY_FILE

RUN cd /tmp \
 && wget $ARTIFACTORY_URL \
 && unzip $ARTIFACTORY_FILE \
 && mv $ARTIFACTORY_NAME /artifactory/ \
 && rm -rf /tmp/*

CMD /artifactory/bin/artifactory.sh

VOLUME /artifactory/data
VOLUME /artifactory/etc
VOLUME /artifactory/logs
VOLUME /artifactory/backup

EXPOSE 8081
