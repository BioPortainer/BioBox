FROM bioportainer/supervisord:cudnn

USER root

ADD BioGUI $HOME/BioGUI
ADD .config/biogui.conf /etc/supervisor/conf.d/biogui.conf

RUN chmod -R +x $HOME/BioGUI/conf/scripts/ \
    && chown -R $USER:$USER $HOME/BioGUI

USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install tornado typing \
    && pyenv deactivate
    
EXPOSE 5000
