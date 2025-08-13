docker run -d --privileged \
  --name dind-test \
  -v "$(pwd)":/home \
  -v "$(pwd)/overlay/var/lib/docker":/var/lib/docker \
  -e DOCKER_TLS_CERTDIR= \
  docker:dind