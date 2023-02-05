FROM owasp/zap2docker-stable

USER root

COPY ./ssl/* /var/www/ssl/

RUN cp -p /var/www/ssl/ca.cert.pem /usr/local/share/ca-certificates/development.local.ca-cert.crt \
    && update-ca-certificates

USER zap

ENTRYPOINT /bin/bash && sleep infinity
