FROM python:3.10-slim@sha256:a0280d019ed7017315c2a9bf51abaf79e89279f4ee67bd3364c93bea4a10fe5d

RUN \
    apt-get -qq update && \
    apt-get -qq install --no-install-recommends gcc libc6-dev libcurl4-openssl-dev libssl-dev curl jq && \
    pip3 install --no-cache-dir APIFuzzer && \
    apt-get -qq remove --purge gcc libc6-dev libcurl4-openssl-dev libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/usr/local/bin/APIFuzzer"]
