FROM debian:bullseye

RUN apt update && apt upgrade -y && \
    apt install -y wget gnupg2 apt-utils && \
    wget -O- http://deb.kamailio.org/kamailiodebkey.gpg | apt-key add - && \
    echo "deb     http://deb.kamailio.org/kamailio57 bullseye main" > /etc/apt/sources.list.d/kamailio.list && \
    echo "deb-src http://deb.kamailio.org/kamailio57 bullseye main" >> /etc/apt/sources.list.d/kamailio.list && \
    apt update && apt install -y kamailio &&\
    apt clean -y

VOLUME /etc/kamailio

CMD kamailio -DD -E -e
