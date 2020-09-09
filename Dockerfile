# Container image that runs your code
FROM alpine:3.10

RUN pip install command python37
RUN npm install
RUN pip install --upgrade nbdime

# Copies your code file from your action repository to the filesystem path `/` of the container
#COPY --from=builder /app/dist /jupydiff/dist/
#RUN chmod +x /jupydiff/dist/index.js

# Code file to execute when the docker container starts up (`entrypoint.sh`)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
