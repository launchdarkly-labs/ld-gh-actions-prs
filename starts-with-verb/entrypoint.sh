#!/usr/bin/env bash

title=$(jq -r .pull_request.title "$GITHUB_EVENT_PATH")

if [[ -n "$IGNORE_PREFIX_PCRE" ]]; then
    prefix=$(echo "$title" | perl -ne "my \$pat='${IGNORE_PREFIX_PCRE}'; print \$_ =~ \$pat")
    echo "Ignoring prefix using PCRE '${IGNORE_PREFIX_PCRE}'"
    if [[ -n "$prefix" ]]; then
        echo "Ignoring prefix '${prefix}'"
        title=${title:${#prefix}}
    fi
fi

words=( $title )

match="$(jq ".V[]|select(. == \"${words[0],,}\")" /2of12id.json)"

if [[ -z "$match" ]]; then
    echo "FAIL: First word '${words[0]}' is not a recognized verb"
    exit 1
fi

echo "First word '${words[0]}' is a recognized verb"
