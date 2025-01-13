The Front Server Steam ID:
Linux: 2334200
Windo: 2612550

Windows how to setup:
https://steamcommunity.com/sharedfiles/filedetails/?id=3049715226

Docker Steamcmd:
https://hub.docker.com/r/steamcmd/steamcmd

## Build

```bash
docker build -t the-front:rc1 .
```

## Run

```bash
docker run --entrypoint /bin/sh -it the-front:rc1
```

## Steam Commands

Install linux the front server:
`steamcmd +force_install_dir "/the_front_server" +login anonymous +app_update 2334200 validate +quit`



/Game/Root/Map

ubuntu@70a9904a8ec4:~/.steam/steam/steamapps/common/LinuxServer/ProjectWar/Binaries/Linux

./TheFrontServer ProjectWar ProjectWar_Start ?Listen?MaxPlayers=8 -server -game -QueueThreshold=8 -ServerName="YOUR SERVER NAME" -log log=log.log -locallogtimes -EnableParallelCharacterMovementTickFunction -EnableParallelCharacterTickFunction -UseDynamicPhysicsScene

./TheFrontServer ProjectWar ProjectWar_Start ?Listen?MaxPlayers=8 -server -game -QueueThreshold=8 -ServerName="YOUR SERVER NAME" -log log=l
og.log -locallogtimes -EnableParallelCharacterMovementTickFunction -EnableParallelCharacterTickFunction -UseDynamicPhysicsScene -port=53000 -BeaconPort=53001 -QueryPort=53002 -Game.PhysicsVehicle=false -ansimalloc -Game.MaxFrameRate=35 -ShutDownServicePort=53003

