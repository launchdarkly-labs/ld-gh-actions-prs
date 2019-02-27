FROM python:3

RUN apt-get update &&
    apt-get install -y jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD requirements.txt .
RUN pip install -r requirements.txt
RUN python -m spacy download en

ADD starts_with_verb.py /usr/local/bin

ADD entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
