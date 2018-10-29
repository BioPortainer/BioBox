FROM ubuntu:18.04

############### Environment config
ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/bash
ENV USER biobox
ENV UID 1000
ENV HOME /headless
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8

ADD .config/gotty /usr/bin
ADD .config/gdrive /usr/bin

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends bash git zip wget pwgen parallel screen \
    pv ca-certificates tmux tmate fuse gosu locales mlocate script \
    && apt-key adv –keyserver keyserver.ubuntu.com \
    –recv-keys 1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B \
    && add-apt-repository “deb [arch=amd64] \
    https://osquery-packages.s3.amazonaws.com/DISTRO DISTRO main” \
    && apt-get update && apt-get install osquery \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ \
    && locale-gen en_US.UTF-8 \
    && export PASS="$(pwgen -1 12)" && groupadd fuse \
    && useradd -d $HOME --shell /bin/bash --uid $UID --user-group \
    --groups adm,sudo,fuse $USER \
    && echo "$USER:$PASS" | chpasswd \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /.config \
    && mkdir -p $HOME/workdir/data \
    && mkdir -p $HOME/workdir/notebooks \
    && echo "############### Welcome to Minimal BioBox ###############" \
    >> /.config/.login \
    && echo "############## User: $USER - Pass: $PASS ##############" \
    >> /.config/.login \
    && echo " "  >> /.config/.login \
    && echo " "  >> /.config/.login \
    && chown -R $USER:$USER $HOME && chown -R $USER:$USER /.config

WORKDIR $HOME/workdir/data

USER $USER
VOLUME ["$HOME/workdir/data", "$HOME/notebooks"]
CMD ["/bin/bash"]
