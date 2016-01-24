# docker.url_check_service

The docker tooling and files to run the url_check_service app in dev and production mode

## Install

just run

    make install

and it will clone the latest version of the service.
Then edit the links that you want to check in the files config on

    ./app/links.md

And run.

## Steps to run

For local development simply run `make run-local`. Once built, the container will run the Flask demo app on `http://<container_ip>:5000`.

To run the deploy in a production container, run `make run-deploy`. Once built, the container will run the Flask demo app on `http://<container_ip>`.

In addition to the `run` commands, `make build-local` and `make build-deploy` are available to allow building containers without running them.


## Useful Docker Commands (use with care)

- View docker images
```
docker images
```
- List actively running images (add -l to include stopped containers)
```
docker ps
```
- View container logs
```
docker logs -f <containerID>
```
- Stop container
```
docker stop <containerID>
```
- Delete dead images
```
for i in `docker images|grep \<none\>|awk '{print $3}'`;do docker rmi $i;done
```
- Delete containers
```
docker rm -f `docker ps --no-trunc -a -q`
```
