FROM bioportainer/pipetools:cuda

USER root

ADD .config/start.sh /
ADD .config/supervisord.conf /etc/
ADD .config/supervisor.conf /etc/supervisor/conf.d/

RUN mkdir -p /.config/supervisord \
    && chmod +x /start.sh && chown $USER:$USER /start.sh \
    && chown -R $USER:$USER /.config/supervisord

USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON2_VERSION \
    && pip install supervisor superlance \
    && pyenv deactivate
    
EXPOSE 9001
VOLUME ["/etc/supervisor/conf.d/", "/.config/"]
CMD ["/start.sh"]
