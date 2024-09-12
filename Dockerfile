FROM ubuntu:22.04

WORKDIR /judge
RUN apt update
RUN apt install -y git g++ cmake ninja-build libseccomp-dev libnl-genl-3-dev libsqlite3-dev libz-dev libssl-dev ghc python2 python3 python3-numpy python3-pil libboost-all-dev libzstd-dev
RUN apt-get -y install build-essential nghttp2 libnghttp2-dev libssl-dev
COPY . ./

WORKDIR /judge/build
RUN cmake -G Ninja ..
RUN ninja && ninja install

WORKDIR /judge

CMD ["/judge/scripts/init.sh", "-v"]
