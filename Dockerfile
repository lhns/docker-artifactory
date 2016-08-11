FROM lolhens/baseimage-oracle-jdk:latest
MAINTAINER LolHens <pierrekisters@gmail.com>


ENV ARTIFACTORY_VERSION 4.11.0
ENV ARTIFACTORY_NAME artifactory-oss-$ARTIFACTORY_VERSION
ENV ARTIFACTORY_FILE jfrog-$ARTIFACTORY_NAME.zip
ENV ARTIFACTORY_URL https://bintray.com/artifact/download/jfrog/artifactory/$ARTIFACTORY_FILE


RUN cd /tmp \
 && wget $ARTIFACTORY_URL \
 && unzip $ARTIFACTORY_FILE \
 && mv $ARTIFACTORY_NAME /usr/local/artifactory/ \
 && cleanimage

RUN appfolders add "artifactory/data" "/usr/local/artifactory/data" \
 && appfolders add "artifactory/etc" "/usr/local/artifactory/etc" \
 && appfolders add "artifactory/logs" "/usr/local/artifactory/logs" \
 && appfolders add "artifactory/backup" "/usr/local/artifactory/backup"


WORKDIR /usr/local/artifactory
CMD bin/artifactory.sh


VOLUME /usr/local/appdata/artifactory

EXPOSE 8081
