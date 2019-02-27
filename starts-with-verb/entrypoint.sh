#!/bin/sh

exec starts_with_verb.py "$(jq -r .pull_request.title "$GITHUB_EVENT_PATH")"
