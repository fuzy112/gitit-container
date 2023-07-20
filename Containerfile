FROM debian:bookworm-slim

# setting locale
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/*
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y gitit && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /config /data \
        && gitit --print-default-config > /config/gitit.conf

VOLUME /data
WORKDIR /data

ENTRYPOINT [ "gitit", "-f", "/config/gitit.conf" ]
