FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ADD .config/wrapdocker /wrapdocker

RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https ca-certificates curl lxc iptables \
    bash git \
    && curl -sSL https://get.docker.com/ | sh \
    && chmod +x /wrapdocker \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

VOLUME /var/lib/docker
ENTRYPOINT ["/wrapdocker"]
CMD ["/bin/bash"]
