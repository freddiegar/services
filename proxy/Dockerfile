FROM haproxy:2.1

COPY ./proxy/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

#COPY ./ssl/* /var/www/ssl/

#RUN apt-get update \
#    && apt-get install -y \
#    ca-certificates \
#    && cp -p /var/www/ssl/ca.cert.pem /usr/local/share/ca-certificates/analitica.local.ca-cert.crt \
#    && update-ca-certificates

#RUN apt-get update \
#    && apt-get install -y \
#    curl \
#    && apt-get autoremove -y

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]