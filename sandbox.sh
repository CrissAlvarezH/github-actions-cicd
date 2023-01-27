

# commit=23f91d6
docker build -t 23f91d6-commit .
docker run --rm -d --label "traefik.http.routers.23f91d6.rule=Host(\`23f91d6.cristianalvarezh.com\`)" --network github-action-cicd_default --name 23f91d6-container 23f91d6-commit
