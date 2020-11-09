# Container image that runs your code
FROM python:3.8

WORKDIR  /
# install nbdime
RUN pip install --upgrade nbdime==2.0.0

# update/install git
RUN apt-get update && apt-get install -y git

# install node and npm
RUN apt-get update && apt-get -y install nodejs npm
RUN npm install npm@latest -g

# Code file to execute when the docker container starts up (`entrypoint.sh`)
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

# install node deps
COPY package.json /
RUN npm install

COPY comment.js /
RUN chmod +x /comment.js 

RUN mkdir /output

RUN adduser -u 1000 user
RUN chown -R user:user /output
USER user

ENTRYPOINT ["/entrypoint.sh"]
