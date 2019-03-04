# Starts with verb

[![Docker Automated build](https://img.shields.io/docker/automated/launchdarkly/ld-gh-actions-pr-starts-with-verb.svg)](https://hub.docker.com/r/launchdarkly/ld-gh-actions-pr-starts-with-verb)

## starts-with-verb

Ensures your pull request starts with a verb.  Uses 2of12 word list as converted to json in https://github.com/felixfischer/categorized-words.  Add this to your `.github/main.workflow` to enable:


```
workflow "Pull request" {
  on = "pull_request"
  resolves = ["Title starts with verb"]
}

action "Title starts with verb" {
  uses = "docker://launchdarkly/ld-gh-actions-prs/starts-with-verb@master"
  env = {
    IGNORE_PREFIX_PCRE="(\\[.*?\\]\\s*)?\s*"
  }
}
```

### Development

Install `bats` (`brew install bats` on OSX) and run `make test` to run unit tests.
Run `make integration-test` to run Docker integration test.
