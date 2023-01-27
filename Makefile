
deploy:
	sh manage.sh deploy

temp-staging:
	sh manage.sh temp-staging $(commit)

rm-temp-staging:
	sh manage.sh rm-temp-staging $(commit)

down:
	docker compose down
