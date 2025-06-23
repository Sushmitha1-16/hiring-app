FROM tomcat:8.0.20-jre8

# Define environment variables
ENV NEXUS_REPO_URL=http://18.191.181.115:8081/repository/hiring-app
ENV ARTIFACT_PATH=junit/hiring/0.1/hiring-0.1.war

# Install curl (in case base image doesn't have it)
RUN apt-get update && apt-get install -y curl

# Download the WAR file from Nexus and place it in Tomcat's webapps directory
RUN curl -o /usr/local/tomcat/webapps/hiring.war "$NEXUS_REPO_URL/$ARTIFACT_PATH"

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

