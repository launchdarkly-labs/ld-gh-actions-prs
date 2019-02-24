# Pull Request Actions


# starts-with-verb

Ensures your pull request starts with a verb.  Uses 2of12 word list as converted to json in https://github.com/felixfischer/categorized-words.  Add this to your `.github/main.workflow` to enable:


```
workflow "Pull request" {
  on = "pull_request"
  resolves = ["Title starts with verb"]
}

action "Title starts with verb" {
  uses = "launchdarkly/ld-gh-actions-prs/starts-with-verb@master"
  env = {
    IGNORE_PREFIX_PCRE="(\\[.*?\\]\\s*)?\s*"
  }
}
```
