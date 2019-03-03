FROM python:3.7-slim as builder

RUN apt-get update && \
    apt-get install -y python3-dev gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD requirements.txt .
RUN pip install -r requirements.txt
RUN python -m spacy download en

# Keep only english language files
RUN cd /usr/local/lib/python3.7/site-packages/spacy/lang/ && find . -type d -mindepth 1 -maxdepth 1 \! \( -name en \) -exec rm -rf '{}' \;

FROM python:3.7-slim

RUN apt-get update && \
    apt-get install -y jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/lib/python3.7/site-packages /usr/local/lib/python3.7/site-packages

ADD starts_with_verb.py /usr/local/bin

ADD entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
