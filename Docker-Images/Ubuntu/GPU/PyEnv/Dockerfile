FROM bioportainer/base:gpu

ENV PYENV_ROOT $HOME/.scienv/envs/pyenv
ENV PYENV $HOME/.scienv/envs/pyenv/bin:$HOME/.scienv/envs/pyenv/shims:$HOME/.scienv/envs/pyenv/envs:$HOME/.scienv/envs/pyenv:$HOME/.scienv/envs/pyenv/plugins
ENV PYTHON-BUILD $HOME/.scienv/envs/pyenv/plugins/python-build/bin
ENV PYENV-DOCTOR $HOME/.scienv/envs/pyenv/plugins/pyenv-doctor/bin
ENV PYENV-INSTALLER $HOME/.scienv/envs/pyenv/plugins/pyenv-installer/bin
ENV PYENV-UPDATE $HOME/.scienv/envs/pyenv/plugins/pyenv-update/bin
ENV PYENV-VIRTUALENV $HOME/.scienv/envs/pyenv/plugins/pyenv-virtualenv/bin
ENV PYENV-WHICH-EXT $HOME/.scienv/envs/pyenv/plugins/pyenv-which-ext/bin
ENV PATH $HOME/.scienv/bin:$HOME/.scienv/envs:$PYENV:$PATH

USER $USER

RUN scienv install pyenv \
    && echo 'eval "$(pyenv init -)"' >> $HOME/.bash_profile \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bash_profile \
    && echo 'export PYENV_VIRTUALENV_DISABLE_PROMPT=1' >> $HOME/.bash_profile \
    && echo 'export PYENV_ROOT="$HOME/.scienv/envs/pyenv"' >> $HOME/.bash_profile \
    && echo 'eval "$(pyenv init -)"' >> $HOME/.bashrc \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc \
    && echo 'export PYENV_VIRTUALENV_DISABLE_PROMPT=1' >> $HOME/.bashrc \
    && echo 'export PYENV_ROOT="$HOME/.scienv/envs/pyenv"' >> $HOME/.bashrc \
    && eval "$($PYENV_ROOT/bin/pyenv init -)" \
    && eval "$($PYENV_ROOT/bin/pyenv virtualenv-init -)" \
    && /bin/bash -c "exec $SHELL -l" \
    && /bin/bash -c "source $HOME/.bashrc" \
    && /bin/bash -c "source $HOME/.bash_profile" \
    && /bin/bash -c "source $PYENV_ROOT/completions/pyenv.bash" \
    && chown -R $USER:$USER $HOME

ENV PYTHON3_VERSION miniconda3-latest

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv install $PYTHON3_VERSION \
    && pyenv global $PYTHON3_VERSION \
    && pyenv rehash \
    && pyenv activate $PYTHON3_VERSION \
    && conda config --add channels defaults \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda \
    && conda config --add channels biobuilds \
    && conda update --all && conda clean -tipsy \
    && pyenv deactivate \
    && chown -R $USER:$USER $HOME
    
ENV PYTHON2_VERSION miniconda2-latest

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv install $PYTHON2_VERSION \
    && pyenv global $PYTHON3_VERSION $PYTHON2_VERSION \
    && pyenv rehash \
    && pyenv activate $PYTHON2_VERSION \
    && conda config --add channels defaults \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda \
    && conda config --add channels biobuilds \
    && conda update --all && conda clean -tipsy \
    && pyenv deactivate \
    && chown -R $USER:$USER $HOME
