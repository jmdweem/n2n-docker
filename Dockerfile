FROM ubuntu:22.04 AS builder

RUN cd / \
    && sed -i s@/archive.ubuntu.com/@/mirrors.163.com/@g /etc/apt/sources.list \
    && sed -i s@/security.ubuntu.com/@/mirrors.163.com/@g /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update -y\
    && apt-get install -y openssl libssl-dev glibc-source build-essential autoconf git\
    && git clone https://github.com/ntop/n2n.git \
    && cd n2n \ 
    && git checkout 3.1.1 \
    && ./autogen.sh \
    && ./configure \
    && make

FROM ubuntu:22.04
COPY --from=builder /n2n/supernode /usr/sbin/
