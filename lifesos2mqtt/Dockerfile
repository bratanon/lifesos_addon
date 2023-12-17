ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}


# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG NODESOS_MQTT_VERSION="2.0.1"

# Setup base
RUN \
  apk add --no-cache --virtual .build-dependencies \
    build-base=0.5-r3 \
    linux-headers=6.5-r0 \
    npm=10.2.5-r0 \
  \
  && apk add --no-cache \
    nodejs=20.10.0-r1 \
    yq=4.35.2-r1 \
  \
  && npm install -g nodesos_mqtt@${NODESOS_MQTT_VERSION} \
  && apk del --no-cache --purge .build-dependencies \
  && rm -fr \
    /tmp/*

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Emil Stjerneman <emil@stjerneman.com>"
