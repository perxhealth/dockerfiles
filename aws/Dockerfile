# Bootstrap from a small Alpine linux image
FROM alpine:3.14.2

# Install AWS CLI
RUN apk add --no-cache python3 py3-pip
RUN pip3 install --upgrade pip
RUN pip3 install awscli
RUN rm -rf /var/cache/apk/*

# Ensure awscli is installed correctly
RUN aws --version
