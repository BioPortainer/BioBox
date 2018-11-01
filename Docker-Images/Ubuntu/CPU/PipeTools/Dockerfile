FROM bioportainer/pyenv:cpu

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && conda install -y snakemake-minimal cwltool nextflow \
    && conda clean -tipsy && pyenv deactivate
    
USER root
