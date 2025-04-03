FROM bcsecurity/empire:latest
   
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

