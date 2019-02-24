#!/usr/bin/env bats


@test "entrypoint accepts a title that starts with a verb" {
  export GITHUB_EVENT_PATH=$(mktemp -t starts-with-verb)

  echo '{"pull_request": {"title": "starts with a verb"}}' > "$GITHUB_EVENT_PATH"
  $ENTRYPOINT
}

@test "entrypoint accepts a title that starts with an uppercase verb" {
  export GITHUB_EVENT_PATH=$(mktemp -t starts-with-verb)

  echo '{"pull_request": {"title": "Starts with a verb"}}' > "$GITHUB_EVENT_PATH"
  $ENTRYPOINT
}

@test "entrypoint rejects titles not starting with verbs" {
  export GITHUB_EVENT_PATH=$(mktemp -t starts-with-verb)

  echo '{"pull_request": {"title": "no verb at start"}}' > "$GITHUB_EVENT_PATH"
  $ENTRYPOINT || exit_code=$?
  [[ $exit_code = 1 ]]
}

@test "entrypoint ignores prefix" {
  export GITHUB_EVENT_PATH=$(mktemp -t starts-with-verb)

  export IGNORE_PREFIX_PCRE='\[.*?\]\s*'
  echo '{"pull_request": {"title": "[my-prefix] starts with a verb"}}' > "$GITHUB_EVENT_PATH"
  $ENTRYPOINT
}

@test "entrypoint fails when prefix doesn't match and first word is not a verb" {
  export GITHUB_EVENT_PATH=$(mktemp -t starts-with-verb)

  export IGNORE_PREFIX_PCRE='not-this-prefix'
  echo '{"pull_request": {"title": "[my-prefix] starts with a verb"}}' > "$GITHUB_EVENT_PATH"
  $ENTRYPOINT || exit_code=$?
  [[ $exit_code = 1 ]]
}

@test "entrypoint allows don't as a verb" {
  export GITHUB_EVENT_PATH=$(mktemp -t starts-with-verb)

  cat > "$GITHUB_EVENT_PATH" <<'EOF'
{"pull_request": {"title": "don't do that"}}
EOF
  $ENTRYPOINT
}
