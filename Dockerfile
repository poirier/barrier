# To build and run this properly, run "./docker_build.sh"
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/New_York"
RUN sed -e 's/^# deb-src/deb-src/' </etc/apt/sources.list >/tmp/new-sources && mv /tmp/new-sources /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y build-essential && apt-get build-dep -y barrier
WORKDIR /code
ENTRYPOINT dpkg-buildpackage -us -uc && cp ../*.deb .
