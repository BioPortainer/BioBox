FROM bioportainer/supervisord:cpu

RUN eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install jupyter jupyterlab \
    && pip install bash_kernel \
    && python -m ipykernel install --user \
    && python -m bash_kernel.install --user \
    && jupyter serverextension enable --py jupyterlab --sys-prefix \
    && pyenv deactivate \
    && pyenv rehash \
    && pyenv activate $PYTHON2_VERSION \
    && pip install ipykernel \
    && python -m ipykernel install --user \
    && pyenv deactivate \
    && pyenv rehash \
    && /bin/bash -c "exec $SHELL -l" \
    && /bin/bash -c "source $HOME/.bashrc" \
    && ipython profile create \
    && curl -L http://hbn.link/hb-ipython-startup-script > \
    ~/.ipython/profile_default/startup/00-venv-sitepackages.py
