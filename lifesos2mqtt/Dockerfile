ARG BUILD_FROM=ghcr.io/hassio-addons/base-nodejs:0.2.5
# hadolint ignore=DL3006
FROM ${BUILD_FROM}


# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG NODESOS_MQTT_VERSION="3.0.2"

# Setup base
RUN \
  apk add --no-cache \
    yq \
  \
  && npm install -g nodesos_mqtt@${NODESOS_MQTT_VERSION} \
    --no-audit \
    --no-fund \
    --no-update-notifier \
    --omit=dev \
    --unsafe-perm

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
