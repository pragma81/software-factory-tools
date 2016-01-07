FROM busybox

ENV JIRA_HOME /var/atlassian/jira

RUN mkdir -p 					"$JIRA_HOME" \
	&& chmod -R 700 			"$JIRA_HOME" \
	&& chown -R daemon:daemon 	"$JIRA_HOME"
	
VOLUME ["/var/atlassian/jira"]