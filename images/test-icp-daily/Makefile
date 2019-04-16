all: build

VERSION?=0.1
PREFIX?=powercloud-cicd

build:
	docker build --pull -t $(PREFIX)/test-icp-daily:$(VERSION) .
	rm -rf $(TEMP_DIR)
