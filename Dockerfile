# Container image that runs your code
FROM python:3.7-slim

RUN pip install nbdime==2.0.0
RUN pip install rhino
RUN apt-get update && apt-get install -y git
RUN pip show -f rhino
ENV PATH "$PATH:/usr/local/lib/python3.7/site-packages"
# Copies your code file from your action repository to the filesystem path `/` of the container

# Code file to execute when the docker container starts up (`entrypoint.sh`)asd
COPY entrypoint.sh /
RUN sudo chmod +x /entrypoint.sh
ADD comment.js ./

CMD /entrypoint.sh
