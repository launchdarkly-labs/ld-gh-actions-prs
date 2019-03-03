FROM python:3.7-alpine as builder

RUN apk add --no-cache bash jq python-dev build-base

ADD requirements.txt .
RUN pip install -r requirements.txt
RUN python -m spacy download en

# Keep only english language files
RUN cd /usr/local/lib/python3.7/site-packages/spacy/lang/ && find . -type d -mindepth 1 -maxdepth 1 \! \( -name en \) -exec rm -rf '{}' \;

FROM python:3-alpine

RUN apk add --no-cache bash jq libstdc++

COPY --from=builder /usr/local/lib/python3.7/site-packages /usr/local/lib/python3.7/site-packages

ADD starts_with_verb.py /usr/local/bin

ADD entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
