FROM bioportainer/supervisor:cpu

USER root

ADD .config/bioshell.sh /
ADD .config/bioshell.conf /etc/supervisor/conf.d/bioshell.conf

RUN chmod +x /bioshell.sh && chown $USER:$USER /bioshell.sh

USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install butterfly \
    && pyenv deactivate
    
EXPOSE 9002
