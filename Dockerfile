# =============================
# Dockerfile
# =============================
FROM alpine:latest

RUN apk add --no-cache git build-base libevent-dev openssl-dev

WORKDIR /opt

RUN git clone https://github.com/TelegramMessenger/MTProxy.git

WORKDIR /opt/MTProxy

RUN make

EXPOSE 443

CMD ["objs/bin/mtproto-proxy", \
    "-u", "nobody", \
    "-p", "8888", \
    "-H", "443", \
    "-S", "0123456789abcdef0123456789abcdef", \
    "--aes-pwd", "proxy-secret", "proxy-multi.conf", \
    "-M", "1"]
