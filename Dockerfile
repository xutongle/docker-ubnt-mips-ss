FROM xutongle/docker-ubnt-mips

MAINTAINER XUTONGLE <xutongle@gmail.com>

WORKDIR /app

COPY ss-build.sh /bin

RUN chmod 700 /bin/ss-build.sh \
   && ver=3.1.3 \
   && git clone https://github.com/shadowsocks/shadowsocks-libev \
   && /bin/ss-build.sh update

VOLUME ["/ss"]

ENTRYPOINT ["/bin/ss-build.sh"]

