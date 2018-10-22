FROM bioportainer/biogui:cpu

USER root

ADD .config/butterfly.sh /
ADD .config/butterfly.conf /etc/supervisor/conf.d/butterfly.conf

RUN chmod +x /start.sh && chown $USER:$USER /start.sh

USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install butterfly \
    && pyenv deactivate
    
EXPOSE 5757
