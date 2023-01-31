# Bootstrap from Elixir 1.14.3, Erlang 25.2.2 and Alpine 3.16.3
# official image
FROM hexpm/elixir:1.14.3-erlang-25.2.2-alpine-3.16.3

# Install AWS CLI via Pip3 so we can invoke AWS services later during CI
RUN apk add --no-cache python3 py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir awscli \
    && rm -rf /var/cache/apk/*

# Install the BEAM's native runtime dependencies which no longer ship
# with Alpine
RUN apk add --no-cache openssl libgcc libstdc++ ncurses-libs

# Install bash so any scripts we author and run are easier to reason about
RUN apk add bash
RUN bash --version

# Ensure AWS CLI is installed correctly
RUN aws --version

# Install jq so we can do some json parsing
RUN apk add jq

# Install dependency tools for Elixir and Erlang - these need to be done
# per installation
RUN mix local.hex --force
RUN mix local.rebar --force
