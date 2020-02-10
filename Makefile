all: generate-credentials run-front

.PHONY: generate-credentials
generate-credentials:
	bin/generate-credentials

.PHONY: run-front
run-front:
	bin/run-front
