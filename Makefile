SHELL=/bin/bash
include .env

.PHONY: bld
bld:
	@echo '$(DOCKER_IMAGE)'
	@export DOCKER_BUILDKIT=1;
	@docker buildx build -o type=docker \
  --target=bld \
  --tag='$(DOCKER_IMAGE):bld' \
 .

.PHONY: run
run:
	@docker run \
 --rm \
  --name scour \
  --rm \
   $(DOCKER_IMAGE):bld

# --entrypoint "/bin/ash" \
#
# -it \
