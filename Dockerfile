FROM elixir:1.4.2

RUN apt-get update
RUN curl -OL https://github.com/fhunleth/fwup/releases/download/v0.14.2/fwup_0.14.2_amd64.deb
RUN dpkg -i fwup_0.14.2_amd64.deb
RUN apt-get install -y squashfs-tools
RUN apt-get install -y ssh-askpass
RUN apt-get install -y git g++ libssl-dev libncurses5-dev bc m4 make unzip cmake
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install https://github.com/nerves-project/archives/raw/master/nerves_bootstrap.ez --force

WORKDIR /app/apps/fw

CMD ["mix"]
