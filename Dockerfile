FROM alpine:edge

RUN apk add --update curl && rm -rf /var/cache/apk/*

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
