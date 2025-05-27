FROM alpine:latest

RUN apk add --no-cache git build-base libevent-dev openssl-dev

RUN git clone https://github.com/TelegramMessenger/MTProxy.git /opt/MTProxy

WORKDIR /opt/MTProxy

RUN make

EXPOSE 443

CMD ["./objs/bin/mtproto-proxy", \
     "-u", "nobody", \
     "-p", "8888", \
     "-H", "443", \
     "-S", "abcdef1234567890abcdef1234567890", \
     "--aes-pwd", "proxy-secret", "proxy-multi.conf", \
     "-M", "1"]
