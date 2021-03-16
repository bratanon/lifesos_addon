#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: LifeSOS to MQTT
# Configures lifesos2mqtt
# ==============================================================================
# Creates lifesos configuration directory in case it is non-existing

if ! bashio::fs.directory_exists '/config/lifesos2mqtt'; then
    cp -R /root/lifesos2mqtt /config/lifesos2mqtt \
        || bashio::exit.nok 'Failed to create configuration directory'

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
    bashio::log.red 'See https://lifesospy-mqtt.readthedocs.io'
    bashio::log.red
    bashio::exit.nok
fi

# Raise warning if the directory exists, but the lifesos2mqtt config is missing.
if ! bashio::fs.file_exists '/config/lifesos2mqtt/config.yaml'; then
    bashio::log.fatal
    bashio::log.fatal "Seems like the /config/lifesos2mqtt folder exists,"
    bashio::log.fatal "however config.yaml wasn't found."
    bashio::log.fatal
    bashio::log.fatal "Remove or rename the /config/lifesos2mqtt folder"
    bashio::log.fatal "and the add-on will create a new and fresh one"
    bashio::log.fatal "for you."
    bashio::log.fatal

    bashio::exit.nok
fi

bashio::log.yellow '-----------------------------------------------------------'
bashio::log.yellow 'List all enrolled devices for the base unit'
bashio::log.yellow '-----------------------------------------------------------'

# Always list all enrolled devices in order to add them to the configuration.
exec lifesospy_mqtt --workdir=/config/lifesos2mqtt --devices
