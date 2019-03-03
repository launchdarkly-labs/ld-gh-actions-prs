#!/usr/bin/env python
import os
import sys
import re
import string

import spacy

# Load English tokenizer, tagger, parser, NER and word vectors
nlp = spacy.load('en_core_web_sm')


def assert_starts_with_verb(sentence):
    doc = nlp(sentence.lower())

    assert doc, "No sentence was provided"

    # Find named entities, phrases and concepts
    for entity in doc:
        print(entity, entity.pos_, entity.tag_)

    first_word = next(iter(doc))
    assert first_word.pos_ == 'VERB' and first_word.tag_ in ('VB', 'VBP'), (
        "Verb does not start with a present tense verb: {}".format(first_word))
    print("Sentence starts with '{}' which is a present tense verb".format(first_word))


def main():
    sentence = " ".join(sys.argv[1:])

    # Strip out the prefix
    prefix_pcre = os.getenv("IGNORE_PREFIX_PCRE")
    if prefix_pcre:
        print("Ignoring prefix using PCRE '{}'".format(prefix_pcre))
        match = re.match(prefix_pcre, sentence)
        if match:
            print("Ignoring prefix '${}'".format(match.group(0)))
            sentence = sentence[match.end():]

    assert_starts_with_verb(sentence)


if __name__ == "__main__":
    main()
