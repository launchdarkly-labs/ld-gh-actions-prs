FROM python:3-alpine

RUN apk add --no-cache bash jq

ADD requirements.txt .
RUN pip install -r requirements.txt
RUN python -m spacy download en

ADD starts_with_verb.py /usr/local/bin

ADD entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
