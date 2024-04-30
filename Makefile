DC = docker compose
EXEC = docker exec -it
LOGS = docker logs

STORAGES_FILE = docker_compose/storages.yml
APP_FILE = docker_compose/app.yml
ENV_FILE = --env-file .env

DB_CONTAINER = postgres
APP_CONTAINER = app

PYMANAGE = python manage.py


.PHONY: storages-up
storages-up:
	${DC} -f ${STORAGES_FILE} ${ENV_FILE} up -d

.PHONY: storages-down
storages-down:
	${DC} -f ${STORAGES_FILE} down

.PHONY: storages-logs
storages-logs:
	${LOGS} ${DB_CONTAINER} -f

# Передается сразу и yaml проиложения и хранилищ
# Стоит учитывать связку по именам в сети (depends_on).
.PHONY: app-up
app-up:
	${DC} -f ${APP_FILE} -f ${STORAGES_FILE} ${ENV_FILE} up -d --build

.PHONY: app-down
app-down:
	${DC} -f ${APP_FILE} -f ${STORAGES_FILE} ${ENV_FILE} down

.PHONY: app-createsuperuser
app-createsuperuser:
	${EXEC} ${APP_CONTAINER} ${PYMANAGE} createsuperuser

.PHONY: app-makemigrations
app-makemigrations:
	${EXEC} ${APP_CONTAINER} ${PYMANAGE} makemigrations

.PHONY: app-migrate
app-migrate:
	${EXEC} ${APP_CONTAINER} ${PYMANAGE} migrate

.PHONY: app-collectstatic
app-collectstatic:
	${EXEC} ${APP_CONTAINER} ${PYMANAGE} collectstatic

.PHONY: app-logs
app-logs:
	${LOGS} ${APP_CONTAINER} -f
