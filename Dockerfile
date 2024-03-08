FROM dimjones/toolbox:latest
    
RUN apk add --no-cache clamav clamav-libunrar \
    && freshclam

CMD ["/bin/bash"]