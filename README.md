# docker-filebrowser
[![Docker Status](https://img.shields.io/docker/pulls/ramosisw/filebrowser.svg)](https://hub.docker.com/r/ramosisw/filebrowser)

📂 Web File Browser which can be used as a middleware or standalone app. (Original source) https://filebrowser.xyz

## Supported architectures

* AMD64
* ARM32v7

## Default configuration

```json
{
  "port": 80,
  "baseURL": "/",
  "address": "0.0.0.0",
  "log": "stdout",
  "database": "/etc/filebrowser/db/database.db",
  "root": "/filebrowser"
}
```

## Docker-Compose file
```yml
version: '3.4'

services:
  ftp:
    image: ramosisw/filebrowser:amd64
    container_name: ftp
    volumes:
      # Map route to expose on web
      - ~/ftp:/filebrowser
      # Map route to save db settings
      - ~/filebrowser/db:/etc/filebrowser/db
    ports:
      - '80:80'

```

## Default credentials

* user: admin
* password: admin
