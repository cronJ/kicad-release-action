FROM kicad/kicad:8.0

USER root

RUN apt update && RUN apt install -y zip

RUN mkdir -p /output

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

VOLUME ["/output"]
