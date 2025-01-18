
# The Front - Game Server

<!-- TOC -->
* [The Front - Game Server](#the-front---game-server)
  * [Features](#features)
  * [Disclaimer](#disclaimer)
  * [Simple server start](#simple-server-start)
  * [Configuration / Environment variables](#configuration--environment-variables)
  * [Docker compose example](#docker-compose-example)
  * [Dev notes](#dev-notes)
<!-- TOC -->

This docker image runs a "The Front" game server.

[GitHub repository](https://github.com/bresam/the-front-server)

[Docker hub](https://hub.docker.com/r/bresam/the-front-game-server)

## Features

 - Preinstalled The Front Server on image
 - Auto update of the server on each container start (can be disabled by configuration)
 - Configs by environment variables, see: [Configuration / Environment variables](#configuration--environment-variables) 

## Disclaimer

Some configs are configurable by environment variables, but by no means all of them yet.

If you need more or different configuration possibilities please create a pull request or just open an issue on GitHub with your request [here](https://github.com/bresam/the-front-server/issues).

**IMPORTANT**: If you don't know, the server of "The Front" has beefy resource requirements.   
An estimation for an absolute **minimum** is probably **8GB RAM and 2 CPU's**   
**12 GB RAM and 4 CPU's** is probably better...

**IMPORTANT** The [GPL](./LICENSE) clearly explains that there is no warranty for this free software.

## Simple server start

```bash
# Quick test run without persistence
# IMPORTANT: PublicIpAddress must be reachable from clients and is also the address which is communicated to steam (server list)
docker run \
  -e FRONT_CONFIG_SERVER_NAME="YourServerName" \
  -e FRONT_OUT_IP_ADDRESS="PublicIpAddress" \
  -p "5500:5500/tcp" \
  -p "5500:5500/udp" \
  -p "5501:5501/tcp" \
  -p "5501:5501/udp" \
  -p "5502:5502/tcp" \
  bresam/the-front-game-server:latest
```

```bash
# Run with persistence of game save files
# IMPORTANT: PublicIpAddress must be reachable from clients and is also the address which is communicated to steam (server list)
docker run \
  -e FRONT_CONFIG_SERVER_NAME="YourServerName" \
  -e FRONT_OUT_IP_ADDRESS="PublicIpAddress" \
  -p "5500:5500/tcp" \
  -p "5500:5500/udp" \
  -p "5501:5501/tcp" \
  -p "5501:5501/udp" \
  -p "5502:5502/tcp" \
  -v "/your/host/path/to/front_storage_folder:/home/gameserver/the_front/game_storage"
  bresam/the-front-game-server:latest
```

## Configuration / Environment variables

| Environment variable                | Description                                                                                                                      |
|-------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| `FRONT_SERVER_NAME`                 | Server name shown in server list                                                                                                 |
| `FRONT_SERVER_TITLE`                | Additional title in description on connection to server                                                                          |
| `FRONT_CONFIG_SERVER_NAME`          | Unique name used as part of the game save storage folder, if changed on start another game save state will be loaded/initialized |
| `FRONT_MAX_PLAYERS`                 | Maximum allowed players (default: 10)                                                                                            |
| `FRONT_OUT_IP_ADDRESS`              | Public IP address of the server, must be accessible for all clients, is published and used for connecting from server list       |
| `FRONT_PORT_GAME`                   | Game port TCP & UDP (default: 5500)                                                                                              |
| `FRONT_PORT_BEACON`                 | Beacon port TCP & UDP (default: 5501)                                                                                            |
| `FRONT_PORT_SHUTDOWN_SERVICE`       | Shutdown service port TCP (default: 5502)                                                                                        |
| `FRONT_PORT_QUERY`                  | Steam query port (default: 27015)                                                                                                |
| `FRONT_SERVER_PASSWORD`             | Optional server password                                                                                                         |
| `FRONT_SERVER_AUTO_UPDATE_ON_START` | Update server version on container start (default: true)                                                                         |
| `FRONT_SERVER_ADMIN_ACCOUNTS`       | Steam IDs of administrators, separated by ";" eg.: "xxxx..." or "xxxx...;yyyy..."                                                |
| `FRONT_GAME_PHYSICS_VEHICLE`        | Game config (default: false)                                                                                                     |
| `FRONT_GAME_MAX_FRAME_RATE`         | Game config (default: 35)                                                                                                        |

## Docker compose example

```yaml
services:
  the-front-server:
    image: bresam/the-front-game-server:latest
    environment:
      FRONT_CONFIG_SERVER_NAME: local_test_1
      FRONT_OUT_IP_ADDRESS: 127.0.0.1
      FRONT_SERVER_AUTO_UPDATE_ON_START: false
      FRONT_SERVER_PASSWORD: 1234
      FRONT_SERVER_ADMIN_ACCOUNTS: "xxxxxxxxxxxxxxxxx;yyyyyyyyyyyyyyyyy"
    ports:
      - "5500:5500/tcp"
      - "5500:5500/udp"
      - "5501:5501/tcp"
      - "5501:5501/udp"
      - "5502:5502/tcp"
    volumes:
      - "./game_storage:/home/gameserver/the_front/game_storage"

```

## Dev notes

[General Docs and hints](./docs/general_docs_and_hints.md)
