FROM ubuntu:20.04
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/New_York"
RUN sed -e 's/^# deb-src/deb-src/' </etc/apt/sources.list >/etc/apt/sources.list-with-sources
RUN cat /etc/apt/sources.list-with-sources
RUN mv /etc/apt/sources.list-with-sources /etc/apt/sources.list
RUN apt-get update -qq
#    && apt-get install -y \
#        cmake \
#        git \
#        libavahi-compat-libdnssd-dev \
#        libcurl4-openssl-dev \
#        libxtst-dev \
#        qtdeclarative5-dev
#    && rm -rf /var/lib/apt/lists/*
RUN apt-get install -y build-essential && apt-get build-dep -y barrier
#ENTRYPOINT cd /code && bash clean_build.sh
ENTRYPOINT cd /code && dpkg-buildpackage -us -uc && cp ../*.deb .
