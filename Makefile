.PHONY: all
all: generate-credentials run-services

.PHONY: generate-credentials
generate-credentials:
	bin/generate-credentials

# Deprecate this
.PHONY: run-front
run-frontend:
	bin/run-frontend

.PHONY: run-services
run-services:
	bin/run-services

.PHONY: clean
clean:
	bin/clean

.PHONY: images
images:
	bin/images
