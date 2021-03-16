ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:9.1.5
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy Python requirements file
COPY requirements.txt /tmp/

# Setup base
ARG BUILD_ARCH=amd64
# hadolint ignore=DL3003
RUN \
    apk add --no-cache \
        py3-pip \
        python3 \
    \
    && pip install \
        --no-cache-dir \
        --prefer-binary \
        --find-links "https://wheels.home-assistant.io/alpine-3.13/${BUILD_ARCH}/" \
        -r /tmp/requirements.txt

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH

# Labels
LABEL \
    io.hass.name="LifeSOS2 to MQTT" \
    io.hass.description="MQTT client that interfaces with LifeSOS alarm systems." \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Emil Stjerneman <emil@stjerneman.com>"
