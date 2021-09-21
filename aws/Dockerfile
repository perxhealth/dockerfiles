# Start up on Amazon Linux 2
FROM amazonlinux:2 as builder

# Install unzip so we can extract the archive
RUN yum update -y && yum install -y unzip

# Download the CLI archive, extract and install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install --bin-dir /aws-cli-bin/

# Start fresh again on Amazon Linux 2
FROM amazonlinux:2

# Install less and groff
RUN yum update -y \
  && yum install -y less groff \
  && yum clean all

# Copy over the CLI
COPY --from=builder /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=builder /aws-cli-bin/ /usr/local/bin/

# Ensure CLI is installed correctly
RUN aws --version
