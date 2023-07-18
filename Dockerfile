FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
ENV TERM xterm

# install system packages
RUN apt-get update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
	cmake \
	gcc-arm-none-eabi \
	libnewlib-arm-none-eabi \
	build-essential \
	libstdc++-arm-none-eabi-newlib

RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes \
    git \
    python3

RUN apt-get autoremove
RUN apt-get clean

RUN git clone https://github.com/raspberrypi/pico-sdk.git /opt/pico-sdk
RUN git -C /opt/pico-sdk submodule update --init
RUN 'export PICO_SDK_PATH=/opt/pico-sdk' | tee -a /etc/profile.d/pico-sdk.sh

ENV PICO_SDK_PATH=/opt/pico-sdk

RUN mkdir -pv /home/pico

# create a new user
RUN useradd -ms /bin/bash pico
RUN chown pico:pico /home/pico

# test compilation of simple hello world program
COPY mwe /tmp/mwe
RUN mkdir /tmp/build
WORKDIR /tmp/build
RUN cmake ../mwe
RUN make -j

# clean-up
RUN rm -rf /tmp/mwe

# done
WORKDIR /home/pico