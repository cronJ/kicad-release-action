FROM kicad/kicad:8.0

USER root

RUN apt update
RUN apt install -y zip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]