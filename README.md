# docker-ubnt-mips-ss

[![Build Status](https://travis-ci.org/xutongle/docker-ubnt-mips-ss.svg?branch=master)](https://travis-ci.org/xutongle/docker-ubnt-mips-ss)

Get default ss version

docker run --rm -v /app/ss:/ss xutongle/docker-ubnt-mips-ss
Get last ss version

docker run --rm -it -v /app/ss:/ss xutongle/docker-ubnt-mips-ss update
Get specify ss version

docker run --rm -it -v /app/ss:/ss -e ver=3.1.1 xutongle/docker-ubnt-mips-ss update