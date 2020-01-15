SHELL=/bin/bash
include .env

.PHONY: bld
bld:
	@echo '$(DOCKER_IMAGE)'
	@export DOCKER_BUILDKIT=1;
	@docker buildx build -o type=docker \
  --target=bld \
  --tag='docker.pkg.github.com/$(REPO_OWNER)/$(REPO_NAME)/$(CONTAINER_NAME):$(VERSION)' \
 .

.PHONY: run
run:
	@cat fixtures/inkscape.svg | docker run \
  --rm \
  --name scour \
  --interactive \
  docker.pkg.github.com/$(REPO_OWNER)/$(REPO_NAME)/$(CONTAINER_NAME):$(VERSION)  

