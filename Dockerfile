ARG base_image=debian:10
FROM "$base_image"

RUN set -eux \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
      bash \
      systemd \
      systemd-sysv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
      /tmp/* \
      /var/tmp/* \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
      /etc/systemd/system/*.wants/* \
      /lib/systemd/system/local-fs.target.wants/* \
      /lib/systemd/system/sockets.target.wants/*udev* \
      /lib/systemd/system/sockets.target.wants/*initctl* \
      /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
      /lib/systemd/system/systemd-update-utmp*

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]
