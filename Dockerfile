FROM ubuntu:latest

WORKDIR /usr/src/app

RUN apt update
RUN apt upgrade -y

RUN apt install -y build-essential git bc curl make autoconf libtool git clang-8 libc++-8-dev libc++abi-8-dev golang-go python-yaml flex gettext libmbedtls-dev libssl-dev liblz4-dev ninja-build
RUN DEBIAN_FRONTEND=noninteractive apt install -y tcl

RUN git clone https://github.com/OrchidTechnologies/orchid.git

WORKDIR /usr/src/app/orchid

RUN git submodule update --init --recursive

RUN make -C srv-shared

# || cat /usr/src/app/orchid/cli-shared/out-lnx/x86_64/vpn/libevent/config.log
