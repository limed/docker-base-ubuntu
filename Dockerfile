# vim: set filetype=dockerfile
FROM ubuntu:14.04
MAINTAINER Ed Lim <limed@sudoers.org>

ENV DEBIAN_FRONTEND="noninteractive" \
    LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8"

# Add the trusty-proposed repo
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty-proposed restricted main multiverse universe" >> /etc/apt/sources.list

# Install some utilities
RUN apt-get --quiet update && \
    apt-get install -qy vim \
                        bzip2 \
                        tar \
                        python \
                        python-pip \
                        python-software-properties \
                        curl \
                        wget \
                        apt-transport-https \
                        ca-certificates \
                        supervisor \
                        openssl \
    && apt-get clean -y \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && apt-get purge -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD files/vimrc /root/.vimrc
RUN chown root:root /root/.vimrc
