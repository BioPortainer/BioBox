FROM bioportainer/base:cuda

ENV CUDNN_VERSION 7.3.1.20

USER root

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends cuda-compat-10-0=410.48-1 \
    libcudnn7=$CUDNN_VERSION-1+cuda10.0 \
    && apt-mark hold libcudnn7 \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/
    
USER $USER
