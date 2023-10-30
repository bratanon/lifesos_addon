#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: LifeSOS to MQTT
# Configures lifesos2mqtt
# ==============================================================================
# Creates lifesos configuration directory in case it is non-existing

if ! bashio::fs.file_exists '/config/lifesos2mqtt/config.yaml'; then
    if ! bashio::fs.directory_exists '/config/lifesos2mqtt/'; then
      mkdir /config/lifesos2mqtt
    fi

    cp /root/lifesos2mqtt/default_config.yaml /config/lifesos2mqtt/config.yaml \
        || bashio::exit.nok 'Failed to create configuration file'

    bashio::log.red
    bashio::log.red 'A default configuration file has been created for you'
    bashio::log.red 'in /config/lifesos2mqtt/config.yaml.'
    bashio::log.red
    bashio::log.red 'Please edit any settings as needed then restart'
    bashio::log.red 'LifeSOS to MQTT.'
    bashio::log.red
    bashio::log.red 'HINT: To list devices enrolled on base unit, configure'
    bashio::log.red 'the LifeSOS settings and restart LifeSOS to MQTT.'
    bashio::log.red 'Enrolled devices will be listed in the logs if the'
    bashio::log.red 'connection to the host works.'
    bashio::log.red
    bashio::exit.nok
fi

bashio::log.yellow '-----------------------------------------------------------'
bashio::log.yellow 'List all enrolled devices for the base unit'
bashio::log.yellow '-----------------------------------------------------------'

# Always list all enrolled devices in order to add them to the configuration.
exec lifesospy_mqtt --workdir=/config/lifesos2mqtt --devices
