# Makefile
include setting.conf
export PROJECT_NAME

.PHONY: up-app down-app rebuild-app up-test down-test rebuild-test install-package down-and-remove-volume

# Application commands
up-app:
	UID=$$(id -u) GID=$$(id -g) docker compose -f ./app/docker-compose.app.yml up

down-app:
	docker compose -f ./app/docker-compose.app.yml down

rebuild-app:
	UID=$$(id -u) GID=$$(id -g) docker compose -f ./app/docker-compose.app.yml build --no-cache

# Test commands
up-test:
	UID=$$(id -u) GID=$$(id -g) docker compose -f ./app/docker-compose.server-test.yml up

down-test:
	docker compose -f ./app/docker-compose.server-test.yml down

rebuild-test:
	UID=$$(id -u) GID=$$(id -g) docker compose -f ./app/docker-compose.server-test.yml build --no-cache


install-package:
	@if [ -z "$(CONTAINER)" ] || [ -z "$(PACKAGE)" ]; then \
		echo "使用方法: make install-package CONTAINER=<コンテナ名> PACKAGE=<パッケージ名>"; \
		exit 1; \
	fi
	docker restart $(CONTAINER)
	docker exec -it $(CONTAINER) /bin/bash -c "yarn add $(PACKAGE)"
	docker stop $(CONTAINER)


