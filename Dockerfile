FROM debian:11-slim

RUN apt update \
	&& apt install -y git make g++ wget tar bzip2 \
	&& mkdir -p /opt \
	&& cd /opt \
        && wget https://github.com/gbdk-2020/gbdk-2020-sdcc/releases/download/sdcc-12539-patched/sdcc-amd64-linux2.5-20210711-12539--sms-gg-patched.tar.bz2 \
	&& mv sdcc-amd64-linux2.5-20210711-12539--sms-gg-patched.tar.bz2 sdcc.tar.bz2 \
	&& tar -xf sdcc.tar.bz2 \
	&& rm sdcc.tar.bz2 \
	&& cd /opt \
	&& git clone https://github.com/gbdk-2020/gbdk-2020.git \
	&& cd gbdk-2020 \
	&& SDCCDIR=/opt/sdcc make install \
	&& apt purge -y git g++ wget bzip2 \
	&& apt autoremove -y \
	&& rm -rf /opt/gbdk-2020 \
	&& rm -rf /var/lib/apt/lists/*
