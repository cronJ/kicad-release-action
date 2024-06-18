FROM kicad/kicad:8.0

USER root

RUN apt update
RUN apt install -y pandoc zip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]