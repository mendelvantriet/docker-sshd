# docker-sshd

Dockerfile running an ssh service using passwordless ssh for peer containers.
Normally you should not need sshd in your container, because you can enter a shell in your container using `docker exec`. 

## Build

	docker build -t vantriet/sshd .

## Run

	CID=$(docker run -dit vantriet/sshd);

## Test

	docker ps --no-trunc
	docker exec -it $CID /bin/bash
	ssh localhost
	echo $0

## Links

Inspired by: https://docs.docker.com/engine/examples/running_ssh_service/
	
## Disclaimer

Fit for no purpose

