ARG BUILD_FROM=hassioaddons/base:5.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy Python requirements file
COPY requirements.txt /tmp/

# Setup base
# hadolint ignore=DL3003
RUN \
    apk add --no-cache \
        python3 \
        git \
    \
    && pip3 install \
        --no-cache-dir \
        --prefer-binary \
        --find-links "https://wheels.hass.io/alpine-3.10/${BUILD_ARCH}/" \
        -r /tmp/requirements.txt

# Copy root filesystem
COPY rootfs /

# Labels
LABEL \
    io.hass.name="LifeSOS2 to MQTT" \
    io.hass.description="MQTT client that interfaces with LifeSOS alarm systems." \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Emil Stjerneman <emil@stjerneman.com>" \
    org.label-schema.description="MQTT client that interfaces with LifeSOS alarm systems." \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="LifeSOS2 to MQTT" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://stjerneman.com" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-life2mqtt/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-life2mqtt" \
    org.label-schema.vendor="Community Hass.io Add-ons"
