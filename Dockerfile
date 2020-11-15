# ARG can be used to dynamically build the version of base image
ARG ALPINE_VERSION=3.12

# base image
FROM alpine:${ALPINE_VERSION}

# upgrade apk
RUN apk --no-cache upgrade

# Set port env variable
ENV HTTP_PORT 5000

# Install pip, python and curl
RUN apk add --no-cache python3 curl 

# upgrade pip 
RUN python3 -m ensurepip 

# Create and Add User
RUN addgroup -g 1100 tree && \
    adduser -h /home/tree -s /bin/bash -u 1100 -G tree -D tree 

# Set User
USER tree

# set work directory
WORKDIR /home/tree

#  install Python modules needed by the Python app
COPY ./favtree-webserver/requirements.txt /home/tree/

USER root
RUN python3 -m pip install --upgrade pip
RUN pip3 install --no-cache-dir -r /home/tree/requirements.txt

USER tree
# copy files required for the app to run
COPY ./favtree-webserver/server.py /home/tree/

# run the application
CMD ["python3", "/home/tree/server.py"]
