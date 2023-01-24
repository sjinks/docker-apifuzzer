FROM python:3.10-slim@sha256:0cc309397c78b753c2b925fae833e08bdf222ed95668f005565dff4cf352e11d

RUN \
    apt-get -qq update && \
    apt-get -qq install --no-install-recommends gcc libc6-dev libcurl4-openssl-dev libssl-dev curl jq && \
    pip3 install --no-cache-dir APIFuzzer && \
    apt-get -qq remove --purge gcc libc6-dev libcurl4-openssl-dev libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/usr/local/bin/APIFuzzer"]
