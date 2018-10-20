FROM bioportainer/biobox:latest

USER root

ENV CUDA_VERSION 10.0.130
ENV CUDA_PKG_VERSION 10-0=$CUDA_VERSION-1
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=10.0 brand=tesla,driver>=384,driver<385"
ENV PATH /usr/local/cuda/bin:${PATH}

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends gnupg2 curl \
    && curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub | apt-key add - \
    && echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list \
    && echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list \
    && apt-get update && apt-get install -y --allow-unauthenticated \
    --no-install-recommends cuda-cudart-$CUDA_PKG_VERSION \
    cuda-compat-10-0=410.48-1 \
    && ln -s cuda-10.0 /usr/local/cuda \
    && apt-get purge --autoremove -y curl \
    && apt-get clean && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

USER $USER
