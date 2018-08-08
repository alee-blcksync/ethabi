FROM ubuntu:bionic

LABEL maintainer="matr1xc0in"

ARG ETHABI_UID

# UID is the only thing that matters
ENV SHELL=/bin/sh \
    ETHABI_USER=ethabiuser \
    ETHABI_UID=${ETHABI_UID} \
    ETHABI_GID=7888
ENV HOME=/home/$ETHABI_USER

COPY ./output/ethabi /usr/local/bin/ethabi

RUN groupadd $ETHABI_USER -g $ETHABI_GID && \
    useradd -m -s /bin/bash -N -u $ETHABI_UID $ETHABI_USER && \
    chmod 755 /usr/local/bin/ethabi && \
    chown -R $ETHABI_USER:$ETHABI_GID $HOME && \
    chmod g+w /etc/passwd /etc/group && \
    echo $ETHABI_UID

WORKDIR $HOME
USER $ETHABI_USER

ENTRYPOINT ["/usr/local/bin/ethabi"]
