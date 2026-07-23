#!/bin/bash

#login into DockerHub:
docker login -u jennifersalamon -p DOCKER_PASS

docker stop reactapp || true
docker rm reactapp || true

docker build -t react-ci/cd .
docker run -d --name reactapp -p 8081:80 react-ci/cd
docker tag react-ci/cd jennifersalamon/react-app:ci-cd
docker push jennifersalamon/react-app:ci-cd
