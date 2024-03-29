FROM kalilinux/kali-rolling:latest

WORKDIR /root/

ENV LC_ALL C.UTF-8
ENV STAGING_KEY=RANDOM
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    tini \
    python3-tk python3-pyperclip \
    powershell-empire && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

RUN cd /opt && \
    wget https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.x86_64 && \
    chmod 755 /opt/ttyd.x86_64 && \
    ln -s /opt/ttyd.x86_64 /usr/bin/ttyd
    

# Override these with .env file or command line parameters
ENV EMPIRE_USER=admin \
    EMPIRE_PASS=changeyourpassword \
    EMPIRE_REST_PORT=1337 \
    EMPIRE_SOCKET_PORT=5000 \
    EMPIRE_LHOST=0.0.0.0 \
    EMPIRE_LPORT=443

COPY entrypoint.* /opt/

ENTRYPOINT ["/opt/entrypoint.sh"]

COPY ./scripts/ /opt/scripts/

WORKDIR /usr/share/powershell-empire/

CMD ["python3", "empire.py", "server"]

