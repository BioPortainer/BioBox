FROM bioportainer/biogui:cpu

USER root

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends build-essential \
    && apt-get purge build-essential && apt-get clean \
    && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install snakemake \
    && pyenv deactivate

USER root

RUN apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

USER $USER
