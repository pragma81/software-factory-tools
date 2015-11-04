
FROM dweomer/atlassian-bamboo

ENV MAVEN_VERSION=3.3.3 \
    MAVEN_INSTALL=/usr/lib/maven

USER root

RUN set -x \
 && export DEBIAN_FRONTEND=noninteractive \
### Install Maven
 && mkdir -p ${MAVEN_INSTALL} \
 && wget --progress=dot:mega -O- http://mirrors.muzzy.it/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar -xz --strip=1 -C "${MAVEN_INSTALL}" \
 && chmod -R o=xr ${MAVEN_INSTALL}




