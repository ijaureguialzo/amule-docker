#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ------------------------
	@echo build
	@echo start / stop / restart
	@echo ------------------------
	@echo stats / logs / workspace
	@echo clean
	@echo ------------------------

_header:
	@echo ---------------
	@echo aMule en Docker
	@echo ---------------

_urls: _header
	${info }
	@echo -----------------------------
	@echo [aMule] http://localhost:4711
	@echo -----------------------------

build:
	@docker compose build --pull

_start-command:
	@docker compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker compose stop

restart: stop start

stats:
	@docker stats

logs:
	@docker compose logs amule

workspace:
	@docker compose exec amule /bin/sh

clean:
	@docker compose down -v --remove-orphans
