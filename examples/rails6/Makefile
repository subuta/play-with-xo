# SEE: https://lithic.tech/blog/2020-05/makefile-dot-env
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

dev:
	docker-compose up

build:
	docker run -u501: -v /var/run/docker.sock.raw:/var/run/docker.sock -v ${PWD}:/workspace -w /workspace --entrypoint=pack buildpacksio/pack:0.24.0 build rails6_web_prod --clear-cache --pull-policy if-not-present --builder heroku/buildpacks:20

start:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up
