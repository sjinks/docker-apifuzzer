FROM python:3.10-slim@sha256:b64d1888e5d1ac06ff2c0ad0fd1fe9c2dc5826de2bbe2e5a87ea4b9346edaf1c

RUN \
    apt-get -qq update && \
    apt-get -qq install --no-install-recommends gcc libc6-dev libcurl4-openssl-dev libssl-dev curl jq && \
    pip3 install --no-cache-dir APIFuzzer && \
    apt-get -qq remove --purge gcc libc6-dev libcurl4-openssl-dev libssl-dev && \
    apt-get -qq autoremove --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/usr/local/bin/APIFuzzer"]
