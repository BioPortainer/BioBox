FROM ubuntu:18.04

############### Environment config
ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/bash
ENV USER biobox
ENV UID 1000
ENV HOME /headless

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends bash git zip pwgen parallel screen ncdu \
    pv ca-certificates tmux build-essential wget \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ \
    && export PASS="$(pwgen -1 12)" \
    && useradd -d $HOME --shell /bin/bash --user-group \
    --groups adm,sudo $USER \
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
