FROM bioportainer/supervisor:cpu

USER root

ADD .config/butterfly.sh /
ADD .config/butterfly.conf /etc/supervisor/conf.d/butterfly.conf

RUN chmod +x /butterfly.sh && chown $USER:$USER /butterfly.sh

USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install butterfly \
    && pyenv deactivate
    
EXPOSE 9002
