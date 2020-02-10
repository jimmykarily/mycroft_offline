.PHONY: backend
backend: generate-credentials run-backend

.PHONY: generate-credentials
generate-credentials:
	bin/generate-credentials

.PHONY: run-front
run-frontend:
	bin/run-frontend

.PHONY: run-backend
run-backend:
	bin/run-backend

.PHONY: clean-backend
clean-backend:
	bin/clean-backend
