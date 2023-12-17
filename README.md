# Home Assistant Add-on: LifeSOS to MQTT

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

This add-on provides an MQTT client that interfaces with
[LifeSOS][lifesos-link] alarm system.

## About

This add-on provides an MQTT client that interfaces with
[LifeSOS][lifesos-link] alarm system.
It will publish the state of all devices to an MQTT broker, which can then be
consumed by [Home Assistant][ha-link]. It will also subscribe to topics on the
broker that allow the control of the alarm system (e.g. arm, disarm) and turn
on/off device features (e.g. bypass, home guard etc.).

It was written for & tested with the LS-20/LS-30 model, though it should also
work on the LS-10 model.

[:books: Read the full add-on documentation][docs]

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

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[docs]: https://github.com/bratanon/lifesos_addon/blob/master/lifesos2mqtt/DOCS.md
[lifesos-link]: http://lifesos.com.tw
[ha-link]: https://www.home-assistant.io
