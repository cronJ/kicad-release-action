FROM kicad/kicad:8.0

RUN apt-get update \
    && apt-get install -y zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
