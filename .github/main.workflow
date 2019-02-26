workflow "Pull request" {
  on = "pull_request"
  resolves = ["PR title must start with a verb"]
}

action "PR title must start with a verb" {
  uses = "./starts-with-verb"
  env = {
    IGNORE_PREFIX_PCRE="(\\[.*?\\])?\\s*(.*?\\:)?\\s*"
  }
}
