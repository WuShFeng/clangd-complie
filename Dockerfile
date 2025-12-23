FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list.d/ubuntu.sources && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/ubuntu.sources


RUN apt-get update
RUN apt-get install -y git

RUN if id -u 1000 >/dev/null 2>&1; then \
        old_user=$(id -un 1000); \
        usermod -l devuser -m -d /home/devuser $old_user; \
        chown -R 1000:1000 /home/devuser; \
    else \
        useradd -m -u 1000 devuser; \
    fi
# USER devuser
USER root
WORKDIR /workspace
