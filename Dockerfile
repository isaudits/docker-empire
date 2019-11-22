# Roll our own because:
# - Custom entrypoint that allows us to start REST API
# - Resource scripts to auto launch listeners (pass woth -r)
# - Use debian instead of Ubuntu (smaller and we already use this image elsewhere)

FROM debian:stable

WORKDIR /root/

ENV LC_ALL C.UTF-8
ENV STAGING_KEY=RANDOM
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    curl \
    git \
    sudo \
    apt-utils \
    python2.7 \
    python-dev \
    python-pip \
    python-m2crypto && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# Using BC-SECURITY fork now since original project abandoned
RUN git clone --depth=1 https://github.com/BC-SECURITY/Empire.git /opt/Empire && \
    cd /opt/Empire/ && \
    rm -rf .git && \
    cd /opt/Empire/setup/ && \
    ./install.sh && \
    # fix bug for pefile module not found
    pip install pefile && \
    # installer grabs some more stuff from repo - clean it up!
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

#ENTRYPOINT ["python", "/opt/entrypoint.py"]
ENTRYPOINT ["/opt/entrypoint.sh"]

COPY ./scripts/ /opt/Empire/scripts/

WORKDIR /opt/Empire/

CMD ["/bin/bash"]

