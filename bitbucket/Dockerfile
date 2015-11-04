FROM atlassian/bitbucket-server

MAINTAINER Davide Antelmo <devianter81@gmail.com>

USER root

RUN mkdir -p "${BITBUCKET_HOME}" \
    mkdir    "${BITBUCKET_HOME}/lib" \
    && chmod -R 700 "${BITBUCKET_HOME}" \
    && chown -R daemon:daemon "${BITBUCKET_HOME}"
