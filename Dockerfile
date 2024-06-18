FROM kicad/kicad:8.0

USER root

RUN apt-get update \
    && apt-get install -y zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /output

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

VOLUME ["/output"]
