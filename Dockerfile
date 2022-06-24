FROM amazonlinux:2

ENV LANGUAGE en_US:en
ENV LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN touch ~/.bashrc

RUN yum -y update && \
    yum -y install \
        git \
        openssl-devel \
        openssh-clients \
        unzip \
        wget \
        which \
        zip \
        zlib \
        zlib-devel  \
        tar \
    yum clean all && \
    rm -rf /var/cache/yum

RUN curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o /usr/local/bin/n

RUN bash n 16

RUN npm install -g pnpm

RUN echo "export N_PREFIX=$HOME/.n" >> ~/.bashrc \
    echo "export PATH=$N_PREFIX/bin:$PATH" >> ~/.bashrc

ENTRYPOINT [ "bash", "-c" ]