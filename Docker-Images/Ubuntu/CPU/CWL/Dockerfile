FROM bioportainer/biogui:cpu

USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install cwl \
    && pyenv deactivate
