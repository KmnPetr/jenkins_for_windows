# jenkins_for_windows
building a docker container image for jenkins to run on it with other necessary tools for its operation

it was created specifically for running on a windows machine running bash scripts like on linux

all jenkins settings are saved in docker volumes.

If you're lucky, all the credentials, settings, and the authorized user of the local machine will be pushed inside the container.
If not, then we either do exec on our own into the container and configure git.
Or edit the Dockerfile and docker-compose files.bml in such a way that git runs in a container, has an authorized user, and has access to an ssh key to access the repositories.
After editing the Dockerfile and docker-compose files.yaml needs to change the tag of the generated image in the docker-compose file.yaml or delete the old image!!! it is important
