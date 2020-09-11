# Container image that runs your code
FROM ubuntu:latest

RUN apt-get update \
     && apt-get install -y \
         python3-pip
# Copies your code file from your action repository to the filesystem path `/` of the container

# Code file to execute when the docker container starts up (`entrypoint.sh`)
#COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["bash", "-v ${PWD}:/entrypoint.sh"]
