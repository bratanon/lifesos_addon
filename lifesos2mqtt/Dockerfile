ARG BUILD_FROM=ghcr.io/hassio-addons/ubuntu-base:9.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set workdir
# WORKDIR /opt

# Copy Python requirements file
COPY requirements.txt /opt/

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG BUILD_ARCH=amd64
# Setup base
RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        make \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libncurses5-dev \
        xz-utils\
        tk-dev \
        libxml2-dev \
        libxmlsec1-dev\
        libffi-dev \
        liblzma-dev\
        libedit-dev \
        git \
    && apt-get clean \
    && rm -fr \
        /tmp/* \
        /var/cache/* \
        /var/lib/apt/lists/* \
        /var/log/*.log \
        /var/log/apt

RUN curl https://pyenv.run | bash

ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN eval "$(pyenv init -)"

ENV PYTHON_VERSION=3.8
RUN pyenv install ${PYTHON_VERSION}
RUN pyenv global ${PYTHON_VERSION}

RUN pip install \
        --no-cache-dir \
        --prefer-binary \
        -r /opt/requirements.txt

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="LifeSOS2 to MQTT" \
    io.hass.description="MQTT client that interfaces with LifeSOS alarm systems." \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Emil Stjerneman <emil@stjerneman.com>"
