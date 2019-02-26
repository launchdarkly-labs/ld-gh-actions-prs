FROM alpine

RUN apk add --no-cache bash jq curl perl

ADD 2of12id.json /

ENV TWOOF12_JSON=/2of12id.json

ADD entrypoint.sh /usr/bin

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
