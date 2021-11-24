# Bootstrap from Node 14.17 official image
FROM node:14.17

# Install pnpm version 6.23.1
RUN npm install -g pnpm@6.23.1

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

# Download the AWS CLI archive, extract and install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# Install jq so we can do some json parsing
RUN apt-get install -y jq

# Ensure AWS CLI is installed correctly
RUN aws --version
