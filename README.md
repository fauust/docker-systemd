# docker-systemd

[![travis build status](https://img.shields.io/travis/fauust/docker-systemd?logo=travis)](https://travis-ci.org/fauust/docker-systemd)
[![docker build status](https://img.shields.io/docker/cloud/build/fauust/docker-systemd?logo=docker&label=build)](https://hub.docker.com/r/fauust/docker-systemd)

Docker containers for systemd testing on Debian based OS.

## Build

```bash
❯ docker build . -t systemd-debian-sid  --build-args base_system=debian:sid
```

Example `base_system` arguments :

- `debian:10`
- `debian:sid`
- `ubuntu:18.04`
- `ubuntu:20.04`

The following containers are available from [Docker Hub](https://hub.docker.com/r/fauust/docker-systemd).

```bash
❯ docker pull fauust/docker-systemd:debian-10
❯ docker pull fauust/docker-systemd:debian-sid
❯ docker pull fauust/docker-systemd:ubuntu-18.04
❯ docker pull fauust/docker-systemd:ubuntu-20.04
```

## Usage

For systemd to start, it is necessary to:

- share the volume `/sys/fs/cgroup` with container (use **read-only** mode);
- run the container in `privileged` mode.

```console
❯ docker run --name sys-test --privileged -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro fauust/docker-systemd:debian-10
❯ docker exec -it sys-test bash
root@59c9e3e924e7:/# apt update && apt install procps
...
root@59c9e3e924e7:/# ps fax
    PID TTY      STAT   TIME COMMAND
     34 pts/0    Ss     0:00 bash
    420 pts/0    R+     0:00  \_ ps fax
      1 ?        Ss     0:00 /lib/systemd/systemd
     24 ?        Ss     0:00 /lib/systemd/systemd-journald
```

## Notes

For testing purposes only, do not use in production!
