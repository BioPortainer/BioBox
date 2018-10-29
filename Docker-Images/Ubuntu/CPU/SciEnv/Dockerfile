FROM bioportainer/base:cpu

ENV SCIENV_ROOT $HOME/.scienv
ENV PATH $SCIENV_ROOT/bin:$SCIENV_ROOT/envs:$PATH
ENV SHELL /bin/bash
ENV USER biobox

USER root

RUN apt-get update && apt-get install -y --allow-unauthenticated \
        --no-install-recommends libbz2-dev libc-dev-bin libc6-dev \
        libreadline-dev libreadline6-dev libsqlite3-dev libssl-dev \
        libtinfo-dev zlib1g-dev libcurl4-openssl-dev libxml2-dev \
        libxslt1-dev libyaml-dev libffi-dev
        
USER $USER

RUN $SHELL -c "exec $SHELL -l" \
        && git clone https://github.com/LaBiOS/scienv.git $HOME/.scienv \
        && eval "$($HOME/.scienv/bin/scienv init -)" \
        && $SHELL -c "exec $SHELL -l" \
        && chown -R $USER:$USER $HOME

USER root

RUN apt-get clean && apt-get autoclean && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/
        
USER $USER
