FROM alpine:latest

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

COPY metar.sh /metar.sh

CMD ["/metar.sh"]
