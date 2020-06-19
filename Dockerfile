FROM ubuntu:16.04

#COPY sources.list /etc/apt/sources.list

RUN         apt-get update \
                && apt-get install -y \
                    software-properties-common \
                    wget \
                    build-essential \
                    libopencv-dev \
                    git \
                    htop \
                && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
                && apt-get update \
                && apt-get install -y \
                    make \
                    git \
                    curl \
                    vim \
                    vim-gnome \
                && apt-get install -y cmake=3.5.1-1ubuntu3 \
                && apt-get install -y \
                    gcc-4.9 g++-4.9 gcc-4.9-base \
                    gcc-4.8 g++-4.8 gcc-4.8-base \
                    gcc-4.7 g++-4.7 gcc-4.7-base \
                    gcc-4.6 g++-4.6 gcc-4.6-base \
                && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
                && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100

RUN cd /root && git clone https://github.com/tencent/ncnn && cd ncnn && git checkout 20200616
RUN mkdir -p /root/ncnn/build && cd /root/ncnn/build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr && make -j$(nproc) && make install
