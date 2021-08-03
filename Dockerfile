FROM kalilinux/kali-rolling:latest

WORKDIR /root/

ENV LC_ALL C.UTF-8
ENV STAGING_KEY=RANDOM
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    powershell-empire \
    starkiller && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# Override these with .env file or command line parameters - NOTE CURRENTLY EMPIRE OPTIONS NOT DOING ANYTHING!
ENV EMPIRE_USER='admin' \
    EMPIRE_PASS='changeyourpassword' \
    EMPIRE_REST_PORT='1337' \
    EMPIRE_LHOST='0.0.0.0' \
    EMPIRE_LPORT='443' \
    MSF_LHOST='1.1.1.1' \
    MSF_LPORT='8442'

COPY entrypoint.* /opt/

ENTRYPOINT ["/opt/entrypoint.sh"]

COPY ./scripts/ /opt/scripts/

WORKDIR /opt/

CMD ["powershell-empire", "server"]

