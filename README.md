# Docker Image for orchid server

This docker image builds the orchid server code in the srv-shared dir at https://github.com/OrchidTechnologies/orchid

# Usage

```bash
git clone https://github.com/Gustav-Simonsson/orchid-docker.git
cd orchid-docker
docker image build -t orchid:0.1 .
```

The build downloads over 7GB of data and can take 20+ minutes to complete.

