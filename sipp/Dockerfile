FROM rockylinux:8 as builder

RUN sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/Rocky-Devel.repo &&  \
    yum update -y && \
    yum install -y epel-release wget libpcap-devel openssl-devel libnet-devel cmake3 ncurses-devel && \
    yum groupinstall "Development tools" -y && \
    wget https://github.com/SIPp/sipp/releases/download/v3.7.1/sipp-3.7.1.tar.gz && \
    tar -xzf sipp-3.7.1.tar.gz && \
    cd /sipp-3.7.1 && \
    cmake . -DUSE_SSL=1 -DUSE_PCAP=1 && \
    make

FROM rockylinux:8

RUN yum update -y && \
    yum install -y libpcap openssl libnet && \
    mkdir /scenarios

COPY --from=builder /sipp-3.7.1/sipp /usr/bin/

VOLUME /scenario

ENTRYPOINT [ "/usr/bin/sipp", "kamailio", "-r", "5", "-sf" ]

