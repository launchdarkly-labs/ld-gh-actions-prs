test:
	ENTRYPOINT=$(CURDIR)/entrypoint.sh bats test.bats

IMAGE_NAME=starts-with-verb

integration-test:
	docker build -t $(IMAGE_NAME) .
	export GITHUB_EVENT_PATH=$$PWD/event.json; \
	trap 'rm $$GITHUB_EVENT_PATH' EXIT; \
	echo '{"pull_request": {"title": "starts with a verb"}}' > $$GITHUB_EVENT_PATH; \
	docker run -v $$GITHUB_EVENT_PATH:/tmp/event.json -e GITHUB_EVENT_PATH=/tmp/event.json $(IMAGE_NAME)

.PHONY: test
