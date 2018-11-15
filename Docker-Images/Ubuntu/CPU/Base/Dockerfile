FROM ubuntu:18.04

############### Environment config
ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/bash
ENV HOME /root

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends bash git zip wget libssl1.0.0 \
    ca-certificates locales mlocate debconf curl build-essential \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ \
    && echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "LANG=en_US.UTF-8" > /etc/ \
    && locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales \
    && mkdir -p /.config \
    && mkdir -p $HOME/workdir/data \
    && mkdir -p $HOME/workdir/notebooks

WORKDIR $HOME/workdir/data

VOLUME ["$HOME/workdir/data", "$HOME/workdir/notebooks"]
CMD ["/bin/bash"]
