# docker-systemd

[![travis build status](https://img.shields.io/travis/fauust/docker-systemd?logo=travis)](https://travis-ci.org/fauust/docker-systemd)
[![docker build status](https://img.shields.io/docker/cloud/build/fauust/docker-systemd?logo=docker&label=build)](https://hub.docker.com/r/fauust/docker-systemd)

Docker container for systemd testing on Debian based OS.

## Build

```bash
docker build . -t systemd-debian-sid  --build-args base_system=debian:sid
```

Example `base_system` arguments :

- `debian:10`
- `debian:sid`
- `ubuntu:18.04`
- `ubuntu:20.04`

The following containers are available from [Docker Hub](https://hub.docker.com/r/fauust/docker-systemd).

```bash
docker pull fauust/docker-systemd:debian-10
docker pull fauust/docker-systemd:debian-sid
docker pull fauust/docker-systemd:ubuntu-18.04
docker pull fauust/docker-systemd:ubuntu-20.04
```

## Notes

For testing purposes only, do not use in production!
