# Makefile
include setting.conf
export PROJECT_NAME

.PHONY: up down rebuild

up:
	docker compose up

down:
	docker compose down

rebuild:
	docker compose build --no-cache

