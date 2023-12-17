# Home Assistant Add-on: LifeSOS to MQTT

This add-on provides an MQTT client that interfaces with
[LifeSOS][lifesos-link] alarm system.
It will publish the state of all devices to an MQTT broker, which can then be
consumed by [Home Assistant][ha-link]. It will also subscribe to topics on the
broker that allow the control of the alarm system (e.g. arm, disarm) and turn
on/off device features (e.g. bypass, home guard etc.).

It was written for & tested with the LS-20/LS-30 model, though it should also
work on the LS-10 model.


## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

2. Click the "Install" button to install the add-on.
3. Configure the addon.
4. Start the "LifeSOS to MQTT" add-on.
5. Check the logs of the "LifeSOS to MQTT" add-on to see if everything
   went well.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

LifeSOS to MQTT add-on configuration:

```yaml
log_level: info
lifesos:
  host: 192.168.1.100
  port: 1680
  password: ""
  verbose: false
list_devices_on_start: false
baseunit:
  topic: home/alarm
  name: LifeSOS
  manufacturer: LifeSOS
  model: LS-20
devices:
  - topic: home/kitchen/pir
    id: 012cba
    model: PIR
    manufacturer: LifeSOS
    name: Kitchen

```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

Using `trace` or `debug` log levels puts the SSH and Terminal daemons into
debug mode. While SSH is running in debug mode, it will be only able to
accept one single connection at the time.

### Option group: `lifesos`

The following options are for the option group: `lifesos`.

#### Sub-option: `host`
Host for the LifeSOS TCP Server to connect as a client.

#### Sub-option: `port`
Port for the LifeSOS TCP Server to connect as a client.

#### Sub-option: `password` *(optional)*
Master password, if needed by network interface

#### Sub-option: `verbose` *(optional)*
If true, the logging level for NodeSOS and NodeSOS_MQTT is set to `debug`.


### Option group: `baseunit`
The base unit configuration.

#### Sub-option: `topic`
The device state topic

#### Sub-option: `name` *(optional)*
The device name (used for the device registry)

#### Sub-option: `manufacturer` *(optional)*
The device manufacturer name (used for the device registry)

#### Sub-option: `model` *(optional)*
The device model (used for the device registry)


### Option group: `devices`
A list of devices attached to your system.

#### Sub-option: `topic`
The device state topic

#### Sub-option: `id`
The device id given by the base unit. *(6 chars hex)*

#### Sub-option: `name` *(optional)*
The device name (used for the device registry)

#### Sub-option: `manufacturer` *(optional)*
The device manufacturer name (used for the device registry)

#### Sub-option: `model` *(optional)*
The device model (used for the device registry)


### Option: `list_devices_on_start`
List all enrolled devices on the base unit before starting the service.
This is typically used on the init setup, and when adding new devices to get
their id.


## License

MIT License

Copyright (c) Emil Stjerneman

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=d87001c3_lifesos2mqtt&repository_url=https%3A%2F%2Fgithub.com%2Fbratanon%2Flifesos_addon
[lifesos-link]: http://lifesos.com.tw
[ha-link]: https://www.home-assistant.io
