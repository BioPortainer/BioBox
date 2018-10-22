FROM bioportainer/biogui:cpu

USER root

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends build-essential
    
USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && conda install -y -c bioconda -c conda-forge snakemake \
    && conda clean -tipsy && pyenv deactivate

USER root

RUN apt-get purge -y build-essential && apt-get clean \
    && apt-get autoclean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

USER $USER
