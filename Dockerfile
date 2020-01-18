FROM ubuntu:disco

WORKDIR /usr/src/app

RUN apt update
RUN apt upgrade -y

RUN apt install -y git

# git clone repo before installing deps since it takes much longer
RUN git clone https://github.com/OrchidTechnologies/orchid.git

WORKDIR /usr/src/app/orchid

RUN git submodule update --init --recursive

RUN apt install -y build-essential binutils bc curl make autoconf libtool g++ clang clang-tidy libc++-dev libc++abi-dev python-yaml python3-pip python3-setuptools flex gettext libmbedtls-dev libssl-dev liblz4-dev ninja-build gdb
RUN DEBIAN_FRONTEND=noninteractive apt install -y tcl

# symlink ld to gold linker
RUN rm /usr/bin/ld
RUN ln -s `which gold` /usr/bin/ld
RUN ln -s `which gold` /usr/local/bin/ld

# enable core dumps
RUN ulimit -c unlimited
RUN sysctl kernel.core_pattern

RUN make -j5 -C srv-shared

