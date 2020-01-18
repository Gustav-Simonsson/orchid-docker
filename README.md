# Docker Image for orchid server

This docker image builds and runs the Orchid server (Orchid node).  It pulls the code from the srv-shared dir at https://github.com/OrchidTechnologies/orchid

# Usage

## Build
```bash
git clone https://github.com/Gustav-Simonsson/orchid-docker.git
cd orchid-docker
docker image build -t orchid:0.1 .
```
## Run

```bash
docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -i -t orchid:0.1 /bin/bash
/usr/src/app/orchid/srv-shared/out-lnx/x86_64/orchidd --help
```

This will print available `orchidd` command line arguments.

# Notes

The build downloads over 7GB of data and can take 20+ minutes to complete.

This image is based on Ubuntu 19.04 which ends support after 2020-01-23.  The image will be updated to Ubuntu 20.04 LTS as soon as it is ready (planned for 2020-04-23).

The argument to `docker run` enables gdb to work inside the container.
