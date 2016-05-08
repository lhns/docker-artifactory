FROM lolhens/baseimage-oracle-jdk:latest
MAINTAINER LolHens <pierrekisters@gmail.com>


ENV ARTIFACTORY_VERSION 4.7.5
ENV ARTIFACTORY_NAME artifactory-oss-$ARTIFACTORY_VERSION
ENV ARTIFACTORY_FILE jfrog-$ARTIFACTORY_NAME.zip
ENV ARTIFACTORY_URL https://bintray.com/artifact/download/jfrog/artifactory/$ARTIFACTORY_FILE


RUN cd /tmp \
 && wget $ARTIFACTORY_URL \
 && unzip $ARTIFACTORY_FILE \
 && mv $ARTIFACTORY_NAME /usr/local/artifactory/ \
 && rm -rf /tmp/*


WORKDIR /usr/local/artifactory
CMD bin/artifactory.sh


VOLUME /usr/local/artifactory/data
VOLUME /usr/local/artifactory/etc
VOLUME /usr/local/artifactory/logs
VOLUME /usr/local/artifactory/backup

EXPOSE 8081
