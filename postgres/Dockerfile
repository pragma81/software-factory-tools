# Version 0.0.2

FROM postgres

MAINTAINER Davide Antelmo <devianter81@gmail.com>


ADD create-artifactory-database.sh /docker-entrypoint-initdb.d/create-artifactory-database.sh
RUN chmod 755 /docker-entrypoint-initdb.d/create-artifactory-database.sh
ADD create-bamboo-database.sh /docker-entrypoint-initdb.d/create-bamboo-database.sh
RUN chmod 755 /docker-entrypoint-initdb.d/create-bamboo-database.sh
ADD create-bitbucket-database.sh /docker-entrypoint-initdb.d/create-bitbucket-database.sh
RUN chmod 755 /docker-entrypoint-initdb.d/create-bitbucket-database.sh
ADD create-sonarqube-database.sh /docker-entrypoint-initdb.d/create-sonarqube-database.sh
RUN chmod 755 /docker-entrypoint-initdb.d/create-sonarqube-database.sh
