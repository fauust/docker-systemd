# docker-systemd

[![pre-commit](https://github.com/fauust/docker-ansible/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/fauust/docker-ansible/actions/workflows/pre-commit.yml)
[![build](https://github.com/fauust/docker-ansible/actions/workflows/build.yml/badge.svg)](https://github.com/fauust/docker-ansible/actions/workflows/build.yml)

Multi-arch docker containers for systemd/openrc testing.
Images are available on:

- ghcr.io
- docker.io

## Build

```console
❯ docker build . -f Dockerfile.debian -t systemd-debian-sid  --build-arg base_image=debian:sid-slim
❯ docker build . -f Dockerfile.redhat -t systemd-almalinux-8  --build-arg base_image=almalinux:8
❯ docker build . -f Dockerfile.alpine -t openrc-alpine3.18  --build-arg base_image=alpine:3.18
```

Example `base_system` arguments :

- `debian:10-slim`
- `debian:11-slim`
- `debian:12-slim`
- `debian:sid-slim`
- `ubuntu:18.04`
- `ubuntu:20.04`
- `ubuntu:22.04`
- `ubuntu:23.04`
- `ubuntu:23.10`
- `ubuntu:24.04`
- `fedora:38`
- `fedora:39`
- `almalinux:8`
- `almalinux:9`
- `rockylinux:8`
- `rockylinux:9`
- `alpine:3.17`
- `alpine:3.18`
- `alpine:3.19`

You can also use "non-slim" Debian images (`debian:11`) but we only build images
based on `-slim` versions of Debian images.

The following containers are available from [Docker Hub](https://hub.docker.com/r/fauust/docker-systemd).

```console
❯ docker pull ghcr.io/fauust/docker-systemd:debian-10
❯ docker pull ghcr.io/fauust/docker-systemd:debian-11
❯ docker pull ghcr.io/fauust/docker-systemd:debian-12
❯ docker pull ghcr.io/fauust/docker-systemd:debian-sid
❯ docker pull ghcr.io/fauust/docker-systemd:ubuntu-18.04
❯ docker pull ghcr.io/fauust/docker-systemd:ubuntu-20.04
❯ docker pull ghcr.io/fauust/docker-systemd:ubuntu-22.04
❯ docker pull ghcr.io/fauust/docker-systemd:ubuntu-23.04
❯ docker pull ghcr.io/fauust/docker-systemd:ubuntu-23.10
❯ docker pull ghcr.io/fauust/docker-systemd:ubuntu-24.04
❯ docker pull ghcr.io/fauust/docker-systemd:fedora-38
❯ docker pull ghcr.io/fauust/docker-systemd:fedora-39
❯ docker pull ghcr.io/fauust/docker-systemd:almalinux-8
❯ docker pull ghcr.io/fauust/docker-systemd:almalinux-9
❯ docker pull ghcr.io/fauust/docker-systemd:rockylinux-8
❯ docker pull ghcr.io/fauust/docker-systemd:rockylinux-9
❯ docker pull ghcr.io/fauust/docker-systemd:alpine-3.17
❯ docker pull ghcr.io/fauust/docker-systemd:alpine-3.18
❯ docker pull ghcr.io/fauust/docker-systemd:alpine-3.19
```

## Usage (docker)

For systemd to start, it is necessary to:

- share the volume `/sys/fs/cgroup` with container (use **read-only** mode);
- run the container in `privileged` mode.

You can also use [podman](https://podman.io/) that does not require it, see
below.

```console
❯ docker run --name init-test --rm --privileged -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro fauust/docker-systemd:debian-10
❯ docker exec -it init-test bash
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
❯ podman run --name init-test --rm -d fauust/docker-systemd:debian-10
❯ podman exec -it init-test bash
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
