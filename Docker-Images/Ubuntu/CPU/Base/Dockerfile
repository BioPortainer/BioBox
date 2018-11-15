FROM ubuntu:18.04

############### Environment config
ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/bash
ENV HOME /root
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends bash git zip wget \
    ca-certificates locales mlocate debconf curl \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ \
    && locale-gen en_US.UTF-8 && dpkg-reconfigure locales \
    && mkdir -p /.config \
    && mkdir -p $HOME/workdir/data \
    && mkdir -p $HOME/workdir/notebooks \
    && chown -R $USER:$USER $HOME && chown -R $USER:$USER /.config

WORKDIR $HOME/workdir/data

VOLUME ["$HOME/workdir/data", "$HOME/workdir/notebooks"]
CMD ["/bin/bash"]
