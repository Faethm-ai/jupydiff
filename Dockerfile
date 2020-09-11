# Container image that runs your code
FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y 
RUN apt-get install sudo
RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y build-essential
RUN npm install 
RUN $ python3 --version 
# Copies your code file from your action repository to the filesystem path `/` of the container

# Code file to execute when the docker container starts up (`entrypoint.sh`)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["bash", "-v ${PWD}:/entrypoint.sh"]
