ARG JENKINS_IMAGE=docker.io/jenkins/jenkins
ARG JENKINS_TAG=lts
FROM "${JENKINS_IMAGE}:${JENKINS_TAG}"
COPY plugins.txt plugins.txt
RUN jenkins-plugin-cli --plugin-file plugins.txt
USER root
RUN curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins
ARG HOST_DOCKER_GID
RUN groupmod -g "$HOST_DOCKER_GID" docker
USER jenkins
