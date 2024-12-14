FROM ubuntu:20.04

ENV TZ="Europe/Moscow"
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install make cmake build-essential texlive-full texlive-xetex -y
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
RUN apt install ttf-mscorefonts-installer msttcorefonts -y

COPY ./fonts/ /usr/local/share/fonts
WORKDIR /workspace
CMD [ "/bin/bash", "-ci", "/workspace/build.sh" ]