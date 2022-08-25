# S4L GIPSY Dockerfiles

This repository is to keep a collection of our docker files for various projects.

## JSON-to-Forensic Lucid Encoders

- `gipsy-json-flucid/gipsy-json-u18.docker` -- builds from the `gipsy-src-json-encoder` repo, `integration` branch. Based off Ubuntu 18
    - public images: https://hub.docker.com/r/s4lab/gipsy-json-u18
- `gipsy-isabelle-json/*` -- includes Isabelle/HOL (as a base, from the latest Ubuntu), with `gipsy-src-json-encoder` and `formal-methods` repos added
    - public images: https://hub.docker.com/r/s4lab/gipsy-isabelle-json

### Versions

| Image               |      Tag      | GIPSY version | Notes      |
|---------------------|:--------------|--------------:|------------|
| gipsy-json-u18      | :03-18.04     | [716f159](gipsy-src-json-encoder/commits/716f1591e1795e7d2bf367bea73c49959ed80e70) | Better version than :18.04 with a few default fixes, xterm, compose, network |
| gipsy-json-u18      | :02-18.04     | [a0f17b3](gipsy-src-json-encoder/commits/a0f17b34f1b7f575027a47a671e1729daad4f8b9) | Better version than :18.04 with a few default fixes, xterm, compose, network |
| gipsy-json-u18      | :18.04        | [a0f17b3](gipsy-src-json-encoder/commits/a0f17b34f1b7f575027a47a671e1729daad4f8b9) | Integration branch, very minimal, no compose |
| gipsy-isabelle-json | :01           | [a0f17b3](gipsy-src-json-encoder/commits/a0f17b34f1b7f575027a47a671e1729daad4f8b9) | First version, includes git |

## Bulding images

To build the image:

```bash
cd <the appropriate directory>
make
sudo docker image ls
```

Manually, e.g.:

```bash
sudo docker build -t gipsy-json-u18:18.04 -f gipsy-json-u18.docker .
```

This process is scripted in part with `build.sh` and a `Makefile`.

## Publishing images

To publish the image (**tag proper sequential version, e.g., like `03-18.04` first**):

```bash
sudo docker tag gipsy-json-u18:18.04 s4lab/gipsy-json-u18:18.04
sudo docker login
sudo docker push s4lab/gipsy-json-u18:18.04
```

## Using images

To use the image:

- pull a specific tag:

```bash
docker pull s4lab/gipsy-json-u18:03-18.04
```

- with the custom entry point:

```bash
sudo docker run -it --entrypoint /bin/bash s4lab/gipsy-json-u18:03-18.04
sudo docker run -it --entrypoint /home/gipsy/gipsy-src-json-encoder/bin/multitier/startRegularNode.sh s4lab/gipsy-json-u18:03-18.04
```

- as a `root` inside the container:

```bash
sudo docker exec -u root -it s4lab/gipsy-json-u18:03-18.04 /bin/bash
```

## References

### Docker

* [Lambdalabs Software Stack dockerfiles](https://github.com/NAG-DevOps/lambda-stack-dockerfiles)
* [Official Isabelle distribution](https://hub.docker.com/r/makarius/isabelle)
* [Using sudo with Docker](https://stackoverflow.com/questions/25845538/how-to-use-sudo-inside-a-docker-container)

### Kubernetes

* [Define a Command and Arguments for a Container](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/)
* [Difference between Docker ENTRYPOINT and Kubernetes container spec COMMAND?](https://stackoverflow.com/questions/44316361/difference-between-docker-entrypoint-and-kubernetes-container-spec-command)