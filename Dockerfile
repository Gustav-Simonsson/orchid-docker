FROM ubuntu:disco

WORKDIR /usr/src/app

RUN apt update
RUN apt upgrade -y

RUN apt install -y build-essential git bc curl make autoconf libtool git g++ clang clang-tidy libc++-dev libc++abi-dev golang-go python-yaml python3-pip python3-setuptools flex gettext libmbedtls-dev libssl-dev liblz4-dev ninja-build
RUN DEBIAN_FRONTEND=noninteractive apt install -y tcl

RUN git clone https://github.com/OrchidTechnologies/orchid.git

WORKDIR /usr/src/app/orchid

RUN git submodule update --init --recursive

# todo: configure gold linker

RUN apt install -y binutils

RUN rm /usr/bin/ld
RUN ln -s `which gold` /usr/bin/ld
RUN ln -s `which gold` /usr/local/bin/ld

RUN make -j4 -C srv-shared

RUN /usr/src/app/orchid/srv-shared/out-lnx/x86_64/orchidd
