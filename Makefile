up:
	docker compose up -d

build:
	docker compose build

rebuild:
	docker compose build --no-cache

recreate:
	docker compose up --build --force-recreate -d

stop:
	docker compose stop

pause:
	docker compose pause

unpause:
	docker compose unpause

down:
	docker compose down --remove-orphans

restart:
	docker compose up -d --build

force-restart:
	docker compose down
	docker compose up -d

bash:
	docker compose exec app /bin/bash

# Run a lint fix by path
# make lint-fix Q=<path>
lint-fix:
	python -m black $(Q)
	python -m isort --atomic $(Q) --profile black