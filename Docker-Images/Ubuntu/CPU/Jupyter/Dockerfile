FROM bioportainer/supervisord:cpu

USER root

ADD .config/start-notebook.sh /usr/local/bin/
ADD .config/jupyter.conf /etc/supervisor/conf.d/jupyter.conf
RUN chmod +x /usr/local/bin/start-notebook.sh \
    && chmod 755 /usr/local/bin/start-notebook.sh \
    && apt-get update && apt-get install -y \
    --allow-unauthenticated --no-install-recommends curl \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

USER $USER

RUN eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate miniconda3-latest \
    && pip install jupyter jupyterlab \
    && pip install bash_kernel \
    && python -m ipykernel install --user \
    && python -m bash_kernel.install --user \
    && jupyter serverextension enable --py jupyterlab --sys-prefix \
    && pyenv deactivate \
    && pyenv rehash \
    && /bin/bash -c "exec $SHELL -l" \
    && /bin/bash -c "source $HOME/.bashrc" \
    && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate miniconda2-latest \
    && pip install ipykernel \
    && python -m ipykernel install --user \
    && pyenv deactivate \
    && pyenv rehash \
    && /bin/bash -c "exec $SHELL -l" \
    && /bin/bash -c "source $HOME/.bashrc" \
    && pyenv global miniconda3-latest miniconda2-latest \
    && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" \
    && ipython profile create \
    && curl -L http://hbn.link/hb-ipython-startup-script > \
        ~/.ipython/profile_default/startup/00-venv-sitepackages.py

ENV JUPYTER_TYPE lab
ENV JUPYTER_PORT 8888
