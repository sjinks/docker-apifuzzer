FROM python:3.10-slim@sha256:875d13333257e9f7ac2caf391bc8182fdd43c9c19d6a49fe27166eb42142c68a

RUN \
    apt-get -qq update && \
    apt-get -qq install --no-install-recommends gcc libc6-dev libcurl4-openssl-dev libssl-dev curl jq && \
    pip3 install --no-cache-dir APIFuzzer && \
    apt-get -qq remove --purge gcc libc6-dev libcurl4-openssl-dev libssl-dev && \
    apt-get -qq autoremove --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/usr/local/bin/APIFuzzer"]
