
# The Front - Game Server

---

<!-- TOC -->
* [The Front - Game Server](#the-front---game-server)
  * [Configuration](#configuration)
  * [Run](#run)
  * [Dev notes](#dev-notes)
    * [Build / Run](#build--run)
    * [Run](#run-1)
    * [Steam / Gameserver commands](#steam--gameserver-commands)
<!-- TOC -->

## Configuration

TBD

## Run

TBD

## Dev notes

[Advanced configuration](https://survivalservers.com/wiki/index.php?title=The_Front_Advanced_Configuration)

The Front Server Steam App ID:
 - Linux: 2334200
 - Windows: 2612550

[Windows how to install example](https://steamcommunity.com/sharedfiles/filedetails/?id=3049715226)

[Docker image of steamcmd](https://hub.docker.com/r/steamcmd/steamcmd)

[Steam CMD wiki](https://developer.valvesoftware.com/wiki/SteamCMD)

### Build / Run

```bash
docker build -t the-front-game-server:rc1 .
```

### Run

```bash
# start with default config
docker run the-front-game-server:rc1
```

```bash
# start and connect for manual interaction (dev / test)
docker run --entrypoint /bin/bash -it the-front-game-server:rc1
```

### Steam / Gameserver commands

Install linux the front server:   
`steamcmd +force_install_dir /home/gameserver/the_front +login anonymous +app_update 2334200 validate +quit`


/Game/Root/Map

ubuntu@70a9904a8ec4:~/.steam/steam/steamapps/common/LinuxServer/ProjectWar/Binaries/Linux

./TheFrontServer ProjectWar ProjectWar_Start ?Listen?MaxPlayers=8 -server -game -QueueThreshold=8 -ServerName="YOUR SERVER NAME" -log log=log.log -locallogtimes -EnableParallelCharacterMovementTickFunction -EnableParallelCharacterTickFunction -UseDynamicPhysicsScene

./TheFrontServer ProjectWar ProjectWar_Start ?Listen?MaxPlayers=8 -server -game -QueueThreshold=8 -ServerName="YOUR SERVER NAME" -log log=l
og.log -locallogtimes -EnableParallelCharacterMovementTickFunction -EnableParallelCharacterTickFunction -UseDynamicPhysicsScene -port=53000 -BeaconPort=53001 -QueryPort=53002 -Game.PhysicsVehicle=false -ansimalloc -Game.MaxFrameRate=35 -ShutDownServicePort=53003

