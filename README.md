# docker-systemd

[![GitHub Actions](https://github.com/fauust/docker-systemd/workflows/pre-commit/badge.svg?branch=master)](https://github.com/fauust/docker-systemd/actions?query=workflow%3A%22pre-commit%22)
[![GitHub Actions](https://github.com/fauust/docker-systemd/workflows/build/badge.svg?branch=master)](https://github.com/fauust/docker-systemd/actions?query=workflow%3A%22build%22)

Multi-arch docker containers for systemd testing on Debian based OS.

## Build

```console
❯ docker build . -t systemd-debian-sid  --build-arg base_image=debian:sid-slim
```

Example `base_system` arguments :

- `debian:9-slim`
- `debian:10-slim`
- `debian:11-slim`
- `debian:sid-slim`
- `ubuntu:18.04`
- `ubuntu:20.04`
- `ubuntu:21.04`

You can also use "non-slim" Debian images (`debian:10`) but we only build images
based on `-slim` versions of Debian images.

The following containers are available from [Docker Hub](https://hub.docker.com/r/fauust/docker-systemd).

```console
❯ docker pull fauust/docker-systemd:debian-9
❯ docker pull fauust/docker-systemd:debian-10
❯ docker pull fauust/docker-systemd:debian-11
❯ docker pull fauust/docker-systemd:debian-sid
❯ docker pull fauust/docker-systemd:ubuntu-18.04
❯ docker pull fauust/docker-systemd:ubuntu-20.04
❯ docker pull fauust/docker-systemd:ubuntu-21.04
```

## Usage (docker)

For systemd to start, it is necessary to:

- share the volume `/sys/fs/cgroup` with container (use **read-only** mode);
- run the container in `privileged` mode.

You can also use [podman](https://podman.io/) that does not require it, see
below.

```console
❯ docker run --name sys-test --rm --privileged -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro fauust/docker-systemd:debian-10
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

## Usage (podman)

Podman is much more "systemd friendly", see
<https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container/>.

Here is how to use those containers with podman:

```console
❯ podman run --name sys-test --rm -d fauust/docker-systemd:debian-10
❯ podman exec -it sys-test bash
root@181cc7d48a8a:/# apt update && apt install procps
...
root@181cc7d48a8a:/# ps fax
    PID TTY      STAT   TIME COMMAND
     24 pts/0    Ss     0:00 bash
    859 pts/0    R+     0:00  \_ ps fax
      1 ?        Ss     0:00 /lib/systemd/systemd
     20 ?        Ss     0:00 /lib/systemd/systemd-journald
```

## Notes

For testing purposes only, do not use in production!
