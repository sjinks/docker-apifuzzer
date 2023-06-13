FROM python:3.10-slim@sha256:0efaadc3d081ca344f0d74c76927e5d31f77196028d751e761c311e94b99b561

RUN \
    apt-get -qq update && \
    apt-get -qq install --no-install-recommends gcc libc6-dev libcurl4-openssl-dev libssl-dev curl jq && \
    pip3 install --no-cache-dir APIFuzzer && \
    apt-get -qq remove --purge gcc libc6-dev libcurl4-openssl-dev libssl-dev && \
    apt-get -qq autoremove --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/usr/local/bin/APIFuzzer"]
