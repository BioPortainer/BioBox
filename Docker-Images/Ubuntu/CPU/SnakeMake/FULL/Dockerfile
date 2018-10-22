FROM bioportainer/biogui:cpu

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && conda install -y snakemake \
    && conda clean -tipsy && pyenv deactivate

USER $USER
