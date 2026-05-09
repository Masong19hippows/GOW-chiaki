# Build

This container builds a docker container to be used with game-on-whales using the Chiaki-ng app-image from:

https://github.com/streetpea/chiaki-ng

Run:

```bash
docker build -t gow/chiaki-ng .
```

Optional base image:

```bash
docker build --build-arg BASE_APP_IMAGE=gow/base-app -t gow/chiaki-ng .
```
