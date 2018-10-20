FROM bioportainer/base:gpu

USER root

RUN apt-get update && apt-get install -y --allow-unauthenticated \
        --no-install-recommends libbz2-dev libc-dev-bin libc6-dev \
        libreadline-dev libreadline6-dev libsqlite3-dev libssl-dev \
        libtinfo-dev zlib1g-dev libcurl4-openssl-dev libxml2-dev \
        libxslt1-dev libyaml-dev libffi-dev
        
USER $USER        
        
ENV SCIENV_ROOT $HOME/.scienv
ENV PATH $HOME/.scienv/bin:$HOME/.scienv/envs:$PATH

RUN git clone https://github.com/LaBiOS/scienv.git $HOME/.scienv \
        && echo 'export HOME="$HOME"' >> $HOME/.bash_profile \
        && echo 'export PATH="$HOME/.scienv/bin:$HOME/.scienv/envs:$PATH"' \
        >> $HOME/.bash_profile \
        && echo 'export SCIENV_ROOT="$HOME/.scienv"' >> $HOME/.bash_profile \
        && echo 'eval "$(scienv init -)"' >> $HOME/.bash_profile \
        && echo 'export HOME="$HOME"' >> $HOME/.bashrc \
        && echo 'export PATH="$HOME/.scienv/bin:$HOME/.scienv/envs:$PATH"' \
        >> $HOME/.bashrc \
        && echo 'export SCIENV_ROOT="$HOME/.scienv"' >> $HOME/.bashrc \
        && echo 'eval "$(scienv init -)"' >> $HOME/.bashrc \ 
        && export PATH="$HOME/.scienv/bin:$HOME/.scienv/envs:$PATH" \
        && eval "$($HOME/.scienv/bin/scienv init -)" \
        && /bin/bash -c "exec $SHELL -l" \
        && chown -R $USER:$USER $HOME

USER root

RUN apt-get clean && apt-get autoclean && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/
