# Container image that runs your code
FROM python:3.7

RUN pip install nbdime==2.0.0

# Copies your code file from your action repository to the filesystem path `/` of the container

# Code file to execute when the docker container starts up (`entrypoint.sh`)
COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ./entrypoint.sh
