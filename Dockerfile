# Use the official Jenkins LTS image as the base image
FROM jenkins/jenkins:lts

# Switch to root user for installation
USER root

# Install Docker CLI inside the Jenkins image
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

# Check if the docker group already exists
RUN group_id=999 && \
    group_name=docker && \
    getent group "$group_id" || groupadd -g "$group_id" "$group_name"

# Switch back to the Jenkins user
USER jenkins

# Add the Jenkins user to the docker group
USER root
RUN usermod -aG docker jenkins
USER jenkins
