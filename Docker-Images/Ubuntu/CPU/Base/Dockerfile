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

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends bash git zip wget pwgen parallel screen \
    pv ca-certificates tmux fuse gosu locales \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ \
    && locale-gen en_US.UTF-8 \
    && export PASS="$(pwgen -1 12)" \
    && useradd -d $HOME --shell /bin/bash --uid $UID --user-group \
    --groups adm,sudo,fuse $USER \
    && echo "$USER:$PASS" | chpasswd \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /.config \
    && mkdir -p $HOME/data \
    && mkdir -p $HOME/notebooks \
    && mkdir -p $HOME/workdir \
    && chown -R $USER:$USER $HOME \
    && echo "############### Welcome to Minimal BioBox ###############" \
    >> /.config/.login \
    && echo "############## User: $USER - Pass: $PASS ##############" \
    >> /.config/.login \
    && echo " "  >> /.config/.login \
    && echo " "  >> /.config/.login \
    && chown -R $USER:$USER $HOME

WORKDIR $HOME/data

USER $USER
VOLUME ["$HOME/data", "$HOME/notebooks"]
CMD ["/bin/bash"]
