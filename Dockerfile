ARG ERLANG_VERSION=26
FROM erlang:${ERLANG_VERSION}

# Set working directory
RUN mkdir /buildroot
WORKDIR /buildroot

# Copy our Erlang test application
COPY dockerwatch dockerwatch

# And build the release
WORKDIR dockerwatch
RUN rebar3 as prod release

# Start with clean image
FROM erlang:${ERLANG_VERSION}

# Install the released application
COPY --from=0 /buildroot/dockerwatch/_build/prod/rel/dockerwatch /dockerwatch

# Expose relevant ports
EXPOSE 8080
EXPOSE 8443

CMD ["/dockerwatch/bin/dockerwatch", "foreground"]
