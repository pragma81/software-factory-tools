FROM mattgruter/artifactory:latest

MAINTAINER Davide Antelmo <devianter81@gmail.com>

### Configure postgres connection properties. Connection url is hardcode in property file. I should change this using env variables.
ADD storage.properties ${ARTIFACTORY_HOME}/etc/storage.properties

### Add postgres jdbc driver
RUN wget --progress=dot:mega -P /tmp https://jdbc.postgresql.org/download/postgresql-9.4-1204.jdbc41.jar \

&& mv /tmp/postgresql-9.4-1204.jdbc41.jar ${CATALINA_HOME}/lib
