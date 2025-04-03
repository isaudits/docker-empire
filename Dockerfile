FROM bcsecurity/empire:latest

RUN apt-get update && apt-get install -y --no-install-recommends tini && rm -rf /var/lib/apt/lists/*

RUN cd /opt && \
[ "${TARGETARCH}" = "arm64" ] && FILE="ttyd.aarch64" || FILE="ttyd.x86_64"; \
    wget https://github.com/tsl0922/ttyd/releases/latest/download/${FILE} && \
    chmod 755 /opt/${FILE} && \
    ln -s /opt/${FILE} /usr/bin/ttyd
    

# Override these with .env file or command line parameters
ENV EMPIRE_USER=admin \
    EMPIRE_PASS=changeyourpassword \
    EMPIRE_REST_PORT=1337 \
    EMPIRE_SOCKET_PORT=5000 \
    EMPIRE_LHOST=0.0.0.0 \
    EMPIRE_LPORT=443 \
    EMPIRE_DATA_PATH=/data \
    EMPIRE_DB=sqlite \
    EMPIRE_MYSQL_HOST=localhost:3306 \
    EMPIRE_MYSQL_USERNAME=empire_user \
    EMPIRE_MYSQL_PASSWORD=empire_password \
    EMPIRE_MYSQL_DB=empire

COPY entrypoint.* /opt/

ENTRYPOINT ["/opt/entrypoint.sh"]

COPY ./scripts/ /opt/scripts/

CMD ["./ps-empire", "server", "-f", "--config", "empire/server/config.yaml"]

