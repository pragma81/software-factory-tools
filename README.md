# Software Factory Tools Dockerized


## Getting Started
The current list of tools are:
* Atlassian Bitbucket Server 4.2
* Atlassian Bamboo 5.9.7
* Artifactory Pro 4.3.3
* SonarQube 5.2
* Postgres 9.4

You can use the provided postgres database as repository for services. A postgres schema for every service is already created  with the following simple convention:
* schema name: 'tool name'
* username:'tool name'
* password: 'tool name'

In order to run all the services as docker containers you must in order
 * Start docker data volume containers provided for every service using the following command:
    ```docker-compose -f tools-data.yml```
 * Start docker containers attaching them to custom network (in order to enable comunication between them):
    ```docker-compose --x-networking -f tools.yml -p sf_tools up -d```
    
    
##TODO
 Add Atlassian Jira 7