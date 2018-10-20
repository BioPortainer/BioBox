FROM alpine:latest
MAINTAINER Fabiano Menegidio <fabiano.menegidio@biology.bio.br>

############### Environment config
ENV USER biobox
ENV HOME /workdir
ENV UID 1000

RUN apk update && apk add --no-cache bash vim git sudo wget zip curl pwgen \
    parallel screen unzip \
    && rm -rf /var/cache/apk/* && rm -rf /tmp/ \
    && export PASS="$(pwgen -1 12)" \
    && adduser -s /bin/bash -u $UID -h $HOME -D $USER \
    && echo "$USER:$PASS" | chpasswd \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p $HOME/data \
    && mkdir -p /.config \
    && mkdir -p $HOME/notebooks \
    && chown -R $USER:$USER $HOME \
    && echo "############### Welcome to Minimal BioBox ###############"  >> /.config/.login \
    && echo "############## User: $USER - Pass: $PASS ##############" >> /.config/.login \
    && echo " "  >> /.config/.login \
    && echo " "  >> /.config/.login \
    && chown -R $USER:$USER $HOME

USER $USER
VOLUME ["$HOME/data", "$HOME/notebooks"]
CMD ["/bin/bash"]
