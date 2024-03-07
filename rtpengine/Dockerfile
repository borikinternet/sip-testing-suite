FROM debian:bullseye

ADD rtpengine.sh /rtpengine.sh

RUN apt update && apt upgrade -y && \
  apt install -y wget && \
  wget https://rtpengine.dfx.at/latest/pool/main/r/rtpengine-dfx-repo-keyring/rtpengine-dfx-repo-keyring_1.0_all.deb \
  -O /rtpengine-dfx-repo-keyring_1.0_all.deb && \
  apt install -y /rtpengine-dfx-repo-keyring_1.0_all.deb && \
  echo "deb [signed-by=/usr/share/keyrings/dfx.at-rtpengine-archive-keyring.gpg] https://rtpengine.dfx.at/11.5 bullseye main" \
  | tee /etc/apt/sources.list.d/dfx.at-rtpengine.list && \
  apt update && \
  apt install -y rtpengine && \
  rm -rf /rtpengine-dfx-repo-keyring_1.0_all.deb && apt clean && \
  chmod +x /rtpengine.sh && mkdir /run/rtpengine

VOLUME /etc/rtpengine

EXPOSE 2223/udp
EXPOSE 2224/udp

CMD /rtpengine.sh