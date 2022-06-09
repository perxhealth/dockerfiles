# Bootstrap from Elixir 1.13.4, Erlang 24.3.4 and Alpine 3.15.3
# official image
FROM hexpm/elixir:1.13.4-erlang-24.3.4-alpine-3.15.3

# Install AWS CLI via Pip3 so we can invoke AWS services later during CI
RUN apk add --no-cache python3 py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir awscli \
    && rm -rf /var/cache/apk/*

# Ensure AWS CLI is installed correctly
RUN aws --version

# Install jq so we can do some json parsing
RUN apk add jq

# Install dependency tools for Elixir and Erlang - these need to be done
# per installation
RUN mix local.hex --force
RUN mix local.rebar --force
