# docker-systemd

[![travis build status](https://img.shields.io/travis/fauust/docker-systemd?logo=travis)](https://travis-ci.org/fauust/docker-systemd)

Docker container for systemd tests on Debian based OS.

## Build

```bash
docker build . -t systemd-debian-sid  --build-args base_system=debian:sid
```

Example `base_system` arguments :

- `debian:10`
- `debian:sid`
- `ubuntu:18.04`
- `ubuntu:20.04`

Containers are build on TravisCI (<https://travis-ci.org/fauust/docker-systemd>)
and automatically pushed to Docker registry
(<https://hub.docker.com/r/fauust/docker-systemd>).

The following containers are available :

```bash
docker pull fauust/docker-systemd:debian-10
docker pull fauust/docker-systemd:debian-sid
docker pull fauust/docker-systemd:ubuntu-18.04
docker pull fauust/docker-systemd:ubuntu-20.04
```

## Notes

For testing purposes only, do not use in production!
