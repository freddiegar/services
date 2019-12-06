FROM haproxy:2.1

COPY ./proxy/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]