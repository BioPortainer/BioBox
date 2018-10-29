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

ADD .config/gotty /usr/local/bin/
ADD .config/gdrive /usr/local/bin/

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends bash git zip wget pwgen parallel screen \
    pv ca-certificates tmate locales mlocate tmux fuse gosu \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ \
    && locale-gen en_US.UTF-8 \
    && export PASS="$(pwgen -1 12)" \
    && useradd -d $HOME --shell /bin/bash --uid $UID --user-group \
    --groups adm,sudo $USER \
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
VOLUME ["$HOME/workdir/data", "$HOME/workdir/notebooks"]
CMD ["/bin/bash"]
