# Community Hass.io Add-ons: LifeSOS to MQTT

Example add-on by Community Hass.io add-ons.

## About

LifeSOS to MQTT provides an MQTT client that interfaces with LifeSOS alarm 
systems, sensors and switches. It will publish the state of all devices to an 
MQTT broker, which can then be consumed by any application that provides MQTT 
support, such as Home Assistant. It will also subscribe to topics on 
the broker that allow the control of the alarm system (eg. arm, disarm) and 
turn on/off any attached switches.

It was written for & tested with the LS-30 model, though it should also work on 
the LS-10/LS-20 models. Note that in some markets, they may also be labelled 
under the name of the distributor; eg. SecurePro in Australia, WeBeHome in 
northern Europe.
