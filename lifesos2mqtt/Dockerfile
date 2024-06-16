ARG BUILD_FROM=ghcr.io/hassio-addons/base-nodejs:0.2.3
# hadolint ignore=DL3006
FROM ${BUILD_FROM}


# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG NODESOS_MQTT_VERSION="3.0.0"

# Setup base
RUN \
  apk add --no-cache --virtual .build-dependencies \
    build-base=0.5-r3 \
    linux-headers=6.5-r0 \
  \
  && apk add --no-cache \
    yq=4.35.2-r4 \
  \
  && npm install -g nodesos_mqtt@${NODESOS_MQTT_VERSION} \
    --no-audit \
    --no-fund \
    --no-update-notifier \
    --omit=dev \
    --unsafe-perm \
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
