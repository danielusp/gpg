FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install gnupg2 -y && \
    mkdir -m 777 output

#COPY root/*.sh /root/

WORKDIR /output/