#!/bin/bash

if [ "$1" == "update" ]; then
    cd /app/shadowsocks-libev
    git pull
    if [ "$ver" != "" ]; then
        echo "ss-version" $ver
        git checkout v$ver -b v$ver
    fi
    git submodule init && git submodule update
    ./autogen.sh
    LIBS="-lpthread -lm" \
    LDFLAGS="-Wl,-static -static -static-libgcc -L/opt/c-ares/lib -L/opt/libev/lib" \
    CFLAGS="-I/opt/c-ares/include -I/opt/libev/include" \
    ./configure --host=mips-linux-gnu --prefix=/opt/shadowsocks-libev --disable-ssp --disable-documentation \
    --with-mbedtls=/opt/mbedtls --with-pcre=/opt/pcre --with-sodium=/opt/libsodium
    make && make install && make clean && git checkout master
    mips-linux-gnu-strip /opt/shadowsocks-libev/bin/ss-local
    mips-linux-gnu-strip /opt/shadowsocks-libev/bin/ss-manager
    mips-linux-gnu-strip /opt/shadowsocks-libev/bin/ss-redir
    mips-linux-gnu-strip /opt/shadowsocks-libev/bin/ss-server
    mips-linux-gnu-strip /opt/shadowsocks-libev/bin/ss-tunnel
elif [ "$1" == "bash" ]; then
    /bin/bash
fi

cp -Rf /opt/shadowsocks-libev /ss
