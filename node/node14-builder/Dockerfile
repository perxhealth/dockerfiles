# Bootstrap from Node 14.17 official image
FROM node:14.17

# Install pnpm
RUN npm install -g pnpm

# Install Python3 and Pip
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt-get clean

# Install AWS CLI
RUN pip3 --no-cache-dir install --upgrade awscli

# Ensure AWS CLI is installed correctly
RUN aws --version
