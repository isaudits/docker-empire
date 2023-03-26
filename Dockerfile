FROM bcsecurity/empire:latest

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

WORKDIR /empire

CMD ["sudo -E poetry run python empire.py server"]