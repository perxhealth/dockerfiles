# Bootstrap from Node 20.6 official image
FROM node:20.6.1

# Install pnpm version 8.9.0
RUN npm install -g pnpm@8.9.0

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

# Install GetText
RUN apt-get install -y gettext-base

# Download the AWS CLI archive, extract and install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# Ensure AWS CLI is installed correctly
RUN aws --version

# Install jq so we can do some json parsing
RUN apt-get install -y jq

# Install the bun runtime so we can use it instead of node if we like
RUN curl https://bun.sh/install | bash
