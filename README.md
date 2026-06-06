# Build

This dockerfile builds a container to be used with game-on-whales using the Chiaki-ng app-image from:

https://github.com/streetpea/chiaki-ng

Also contains a virtualhere client to connect dualsense controllers.

Run:

```bash
docker build -t gow/chiaki-ng .
```

Optional base image:

```bash
docker build --build-arg BASE_APP_IMAGE=gow/base-app -t gow/chiaki-ng .
```

Virtualhere:

If /opt/vhui.conf is mounted in the container with a virtualhere config file, then virtualhere will be ran with the chosen config.