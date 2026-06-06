# Build

This dockerfile builds a container to be used with game-on-whales using the Chiaki-ng app-image from:

https://github.com/streetpea/chiaki-ng

Run:

```bash
docker build -t gow/chiaki-ng .
```

Optional base image:

```bash
docker build --build-arg BASE_APP_IMAGE=gow/base-app -t gow/chiaki-ng .
```

Virtualhere:

This container can be ran with virtualhere for seamless passthrough of dualsense controllers.

Create script at `/usr/local/bin/wolfchiaki-watch.sh` with:

```bash
#!/bin/bash

CONTAINER="WolfChiaki"
SERVICE="virtualhereclient"

docker events \
  --filter "container=$CONTAINER" \
  --filter "event=start" \
  --filter "event=stop" \
  --filter "event=die" |
while read -r event; do
    if echo "$event" | grep -q "start"; then
        systemctl start "$SERVICE"

    elif echo "$event" | grep -qE "stop|die"; then
        systemctl stop "$SERVICE"
    fi
done
```

Then make executable with:

```bash
chmod +x /usr/local/bin/wolfchiaki-watch.sh
```

Then create service file at `/etc/systemd/system/wolfchiaki-watch.service` with:

```bash
[Unit]
Description=Watch WolfChiaki Docker container and control service
After=docker.service
Requires=docker.service

[Service]
ExecStart=/usr/local/bin/wolfchiaki-watch.sh
Restart=always
RestartSec=2

[Install]
WantedBy=multi-user.target
```

Enable and start:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now wolfchiaki-watch.service
```