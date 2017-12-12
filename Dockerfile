FROM                        ubuntu:16.04
MAINTAINER                  John Else <john.else@gmail.com>

RUN     apt-get update
RUN     apt-get -y install \
            cmake \
            g++-5 \
            gcc-5 \
            git \
            libhwloc-dev \
            libmicrohttpd-dev \
            libssl-dev

RUN     useradd xmr
RUN     mkdir /home/xmr
RUN     chown xmr /home/xmr

USER    xmr

RUN     git clone https://github.com/fireice-uk/xmr-stak-cpu /home/xmr/xmr-stak-cpu
WORKDIR /home/xmr/xmr-stak-cpu
ENV     CMAKE_CXX_COMPILER g++-5
ENV     CMAKE_C_COMPILER   gcc-5
RUN     cmake \
            -D CMAKE_C_COMPILER=${CMAKE_C_COMPILER} \
            -D CMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} \
            .
RUN     make VERBOSE=1

CMD     ["/home/xmr/xmr-stak-cpu/bin/xmr-stak-cpu", "-c",  "/tmp/config.txt"]
