FROM ubuntu

EXPOSE 22 22

#indicamos el timezone
ARG TZ=Europe/Madrid
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt update && apt install -yq --no-install-recommends \
    apt-utils \
    wget \ 
    curl \ 
    git \
    nano \ 
    tree \
    net-tools \ 
    iputils-ping \
    sudo \ 
    openssh-server \ 
    openssh-client \
    unzip \
    dos2unix \ 
    expect \
    python3

WORKDIR /usr/local/bin
RUN mkdir ./docker
COPY ./start.sh ./docker
RUN chmod o+x ./docker/start.sh
WORKDIR /root
COPY ./id_rsa.pub /root
ENTRYPOINT ["/usr/local/bin/docker/start.sh"]