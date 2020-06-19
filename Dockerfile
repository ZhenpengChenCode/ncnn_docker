FROM ubuntu:16.04

COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y build-essential libopencv-dev cmake git htop
RUN cd /root && git clone https://github.com/tencent/ncnn && cd ncnn && git checkout 20200616
RUN mkdir -p /root/ncnn/build && cd /root/ncnn/build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr && make -j$(nproc) && make install
