# Makefile
include setting.conf
export PROJECT_NAME

.PHONY: up down rebuild install-package down-and-remove-volume

up:
	UID=$$(id -u) GID=$$(id -g) docker compose -f ./app/docker-compose.app.yml up

down:
	docker compose -f ./app/docker-compose.app.yml down

down-and-remove-volume:
	docker compose -f ./app/docker-compose.app.yml down --volumes

rebuild:
	UID=$$(id -u) GID=$$(id -g) docker compose -f ./app/docker-compose.app.yml build --no-cache

install-package:
	@if [ -z "$(CONTAINER)" ] || [ -z "$(PACKAGE)" ]; then \
		echo "使用方法: make install-package CONTAINER=<コンテナ名> PACKAGE=<パッケージ名>"; \
		exit 1; \
	fi
	docker restart $(CONTAINER)
	docker exec -it $(CONTAINER) /bin/bash -c "yarn add $(PACKAGE)"
	docker stop $(CONTAINER)


