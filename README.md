# S4L GIPSY Dockerfiles

This repository is to keep a collection of our docker files for various projects.

## JSON-to-Forensic Lucid Encoders

- `gipsy-json-u18.docker` -- builds from the `gipsy-src-json-encoder` repo, `integration` branch.
   - public image: https://hub.docker.com/r/s4lab/gipsy-json-u18

To build the image:

```bash
sudo docker build -t gipsy-json-u18:18.04 -f gipsy-json-u18.docker .
sudo docker container ls

sudo docker commit efd813b45aa1 gipsy-json-u18:latest
sudo docker image ls
```

To publish the image (tag proper sequential version like 03-18.04, etc.):

```bash
sudo docker tag gipsy-json-u18:18.04 s4lab/gipsy-json-u18:18.04
sudo docker login
sudo docker push s4lab/gipsy-json-u18:18.04
```

To use the image:

- pull:

```bash
docker pull s4lab/gipsy-json-u18
```

- with the custom entry point (assuming `efd813b45aa1` is the hash it was built with):

```bash
sudo docker run -it --entrypoint /bin/bash efd813b45aa1
sudo docker run -it --entrypoint /home/gipsy/gipsy-src-json-encoder/bin/multitier/startRegularNode.sh efd813b45aa1
```
