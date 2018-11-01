FROM bioportainer/pyenv:cpu

RUN apt-get update && apt-get install -y gnupg debconf curl \
  && echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" \
  | debconf-set-selections \
  && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" \
  > /etc/apt/sources.list.d/webupd8team-java-trusty.list  \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
  && apt-get update && apt-get install -y --allow-unauthenticated \
  --no-install-recommends oracle-java8-installer oracle-java8-set-default \
  && rm -rf /usr/lib/jvm/java-8-oracle/*src.zip \
           /usr/lib/jvm/java-8-oracle/missioncontrol \
           /usr/lib/jvm/java-8-oracle/lib/visualvm \
           /usr/lib/jvm/java-8-oracle/lib/*javafx* \
           /usr/lib/jvm/java-8-oracle/jre/plugin \
           /usr/lib/jvm/java-8-oracle/jre/bin/javaws \
           /usr/lib/jvm/java-8-oracle/jre/bin/jjs \
           /usr/lib/jvm/java-8-oracle/jre/bin/orbd \
           /usr/lib/jvm/java-8-oracle/jre/bin/pack200 \
           /usr/lib/jvm/java-8-oracle/jre/bin/policytool \
           /usr/lib/jvm/java-8-oracle/jre/bin/rmid \
           /usr/lib/jvm/java-8-oracle/jre/bin/rmiregistry \
           /usr/lib/jvm/java-8-oracle/jre/bin/servertool \
           /usr/lib/jvm/java-8-oracle/jre/bin/tnameserv \
           /usr/lib/jvm/java-8-oracle/jre/bin/unpack200 \
           /usr/lib/jvm/java-8-oracle/jre/lib/javaws.jar \
           /usr/lib/jvm/java-8-oracle/jre/lib/deploy* \
           /usr/lib/jvm/java-8-oracle/jre/lib/desktop \
           /usr/lib/jvm/java-8-oracle/jre/lib/*javafx* \
           /usr/lib/jvm/java-8-oracle/jre/lib/*jfx* \
           /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libdecora_sse.so \
           /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libprism_*.so \
           /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libfxplugins.so \
           /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libglass.so \
           /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libgstreamer-lite.so \
           /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libjavafx*.so \
           /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libjfx*.so \
           /usr/lib/jvm/java-8-oracle/jre/lib/ext/jfxrt.jar \
           /usr/lib/jvm/java-8-oracle/jre/lib/ext/nashorn.jar \
           /usr/lib/jvm/java-8-oracle/jre/lib/oblique-fonts \
           /usr/lib/jvm/java-8-oracle/jre/lib/plugin.jar \
  && apt-get clean && apt-get autoclean && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ \
  && curl -fsSL get.nextflow.io | bash && mv nextflow /usr/bin
  
  CMD ["/bin/bash"]
