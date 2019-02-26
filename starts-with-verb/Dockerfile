FROM alpine

RUN apk add --no-cache bash jq curl perl

ADD 2of12id.json /

ENV DATA_PATH=/

ADD entrypoint.sh /usr/bin

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
