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
	@echo start / stop / restart
	@echo ------------------------
	@echo stats / logs / workspace
	@echo clean
	@echo ------------------------

_header:
	@echo ---------------
	@echo aMule en Docker
	@echo ---------------

start:
	@docker compose up -d --remove-orphans

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
