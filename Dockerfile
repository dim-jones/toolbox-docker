FROM alpine:latest

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
    
RUN apk add --no-cache clamav clamav-libunrar \
    && freshclam

CMD ["/bin/bash"]
