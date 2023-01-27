
deploy:
	sh manage.sh deploy

refresh:
	sh manage.sh refresh

temp-staging:
	sh manage.sh temp-staging $(commit)

rm-temp-staging:
	sh manage.sh rm-temp-staging $(commit)

down:
	docker compose down
