# Container image that runs your code
FROM ubuntu:20.04

RUN apt-get update \
  && apt-get install -y 

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY --from=builder /app/dist /jupydiff/dist/
RUN chmod +x /jupydiff/dist/index.js

# Code file to execute when the docker container starts up (`entrypoint.sh`)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
