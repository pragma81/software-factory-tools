FROM busybox

MAINTAINER Davide Antelmo <davive.antelmo@gmail.com>

ENV ARTIFACTORY_HOME /var/opt/jfrog/artifactory 

RUN addgroup -g 499 -S artifactory && adduser -S -G artifactory -u 500 artifactory

RUN mkdir -p "${ARTIFACTORY_HOME}" \
	mkdir	 "${ARTIFACTORY_HOME}/backup" \
	mkdir	 "${ARTIFACTORY_HOME}/data" \
	mkdir	 "${ARTIFACTORY_HOME}/logs" \
	mkdir    "${ARTIFACTORY_HOME}/etc" \
	&& chmod -R 755 "${ARTIFACTORY_HOME}" \
	&& chown -R artifactory: "${ARTIFACTORY_HOME}"
	
COPY default "${ARTIFACTORY_HOME}/etc"
COPY storage.properties "${ARTIFACTORY_HOME}/etc"

VOLUME ${ARTIFACTORY_HOME}/backup
VOLUME ${ARTIFACTORY_HOME}/data
VOLUME ${ARTIFACTORY_HOME}/logs
VOLUME ${ARTIFACTORY_HOME}/etc
