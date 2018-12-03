FROM bioportainer/supervisord:cpu

ADD BioGUI /BioGUI
ADD .config/biogui.conf /etc/supervisor/conf.d/biogui.conf

RUN chmod -R +x /BioGUI/conf/scripts/ \
    && mkdir $HOME/BioGUI \
    && ln -s /BioGUI/conf/scripts/ $HOME/BioGUI/scripts \
    && ln -s /BioGUI/conf/runners/ $HOME/BioGUI/runners \
    && eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv activate $PYTHON3_VERSION \
    && pip install tornado typing \
    && pyenv deactivate
    
EXPOSE 5000
EXPOSE 7000

