# SEE: https://lithic.tech/blog/2020-05/makefile-dot-env
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

run:
	go run .

schema:
	xo schema pgsql://postgres:password@localhost/myapp_development?sslmode=disable -o models --exclude={ar_internal_metadata,schema_migrations} --template=json

createdb:
	xo schema pgsql://postgres:password@localhost/myapp_development?sslmode=disable -o models --exclude={ar_internal_metadata,schema_migrations} --template=createdb --createdb-constraint

gen: schema createdb
