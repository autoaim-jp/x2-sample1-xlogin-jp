# Makefile
include setting.conf
export PROJECT_NAME

.PHONY: up down rebuild install-package

up:
	docker compose up

down:
	docker compose down

rebuild:
	docker compose down --volumes
	docker compose build --no-cache

install-package:
	@if [ -z "$(CONTAINER)" ] || [ -z "$(PACKAGE)" ]; then \
		echo "使用方法: make install-package CONTAINER=<コンテナ名> PACKAGE=<パッケージ名>"; \
		exit 1; \
	fi
	docker restart $(CONTAINER)
	docker exec -it $(CONTAINER) /bin/bash -c "yarn add $(PACKAGE)"
	docker stop $(CONTAINER)


