FROM bioportainer/biogui:cpu

USER root

ADD .config/butterfly.conf /etc/supervisor/conf.d/butterfly.conf

USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install butterfly \
    && pyenv deactivate
    
EXPOSE 5757
