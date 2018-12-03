FROM bioportainer/supervisord:cuda

USER root

ADD BioGUI /BioGUI
ADD .config/biogui.conf /etc/supervisor/conf.d/biogui.conf

RUN chmod -R +x /BioGUI/conf/scripts/ \
    && chown -R $USER:$USER /BioGUI \
    && mkdir $HOME/BioGUI \
    && ln -s /BioGUI/conf/scripts/ $HOME/BioGUI/scripts \
    && ln -s /BioGUI/conf/runners/ $HOME/BioGUI/runners \
    && chown -R $USER:$USER $HOME/BioGUI

USER $USER

RUN eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install tornado typing \
    && pyenv deactivate
    
EXPOSE 5000
EXPOSE 6000
