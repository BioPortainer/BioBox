FROM bioportainer/biogui:cpu

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && conda install -y -c bioconda -c conda-forge snakemake-minimal \
    && conda clean -tipsy && pyenv deactivate

USER $USER
