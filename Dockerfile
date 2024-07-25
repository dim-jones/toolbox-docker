FROM alpine:3.20.2

RUN apk add --no-cache \
    bash \
    curl \
    wget \
    vim \
    nano \
    htop \
    tcpdump \
    nmap \
    git \
    jq \
    netcat-openbsd \
    bind-tools \
    traceroute

CMD ["/bin/bash"]
