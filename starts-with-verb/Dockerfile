FROM python:3-alpine as builder

RUN apk add --no-cache python-dev build-base

ADD requirements.txt .
RUN pip install -r requirements.txt
RUN python -m spacy download en

FROM python:3-alpine

RUN apk add --no-cache bash jq

COPY --from=builder /usr/local/lib/python* /usr/local/lib

ADD starts_with_verb.py /usr/local/bin

ADD entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
