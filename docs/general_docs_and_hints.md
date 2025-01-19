## General

[Advanced configuration](https://survivalservers.com/wiki/index.php?title=The_Front_Advanced_Configuration)

The Front Server Steam App ID:
- Linux: 2334200 [SteamDB](https://steamdb.info/app/2334200/)
- Windows: 2612550 [SteamDB](https://steamdb.info/app/2612550/)

[Windows how to install example](https://steamcommunity.com/sharedfiles/filedetails/?id=3049715226)

[Docker image of steamcmd](https://hub.docker.com/r/steamcmd/steamcmd)

[Steam CMD wiki](https://developer.valvesoftware.com/wiki/SteamCMD)

## Build / Push

```bash
docker buildx build --pull --provenance=true --sbom=true -t bresam/the-front-game-server:latest -t bresam/the-front-game-server:x.y.z --push .
```

## Debug / Dev run (connect)

```bash
# start and connect for manual interaction (dev / test)
docker run --entrypoint /bin/bash -it  bresam/the-front-game-server
```

## Steam / Gameserver commands (notes)

Install linux the front server:   
`steamcmd +force_install_dir /home/gameserver/the_front +login anonymous +app_update 2334200 validate +quit`


/Game/Root/Map

ubuntu@70a9904a8ec4:~/.steam/steam/steamapps/common/LinuxServer/ProjectWar/Binaries/Linux

./TheFrontServer ProjectWar ProjectWar_Start ?Listen?MaxPlayers=8 -server -game -QueueThreshold=8 -ServerName="YOUR SERVER NAME" -log log=log.log -locallogtimes -EnableParallelCharacterMovementTickFunction -EnableParallelCharacterTickFunction -UseDynamicPhysicsScene

./TheFrontServer ProjectWar ProjectWar_Start ?Listen?MaxPlayers=8 -server -game -QueueThreshold=8 -ServerName="YOUR SERVER NAME" -log log=l
og.log -locallogtimes -EnableParallelCharacterMovementTickFunction -EnableParallelCharacterTickFunction -UseDynamicPhysicsScene -port=53000 -BeaconPort=53001 -QueryPort=53002 -Game.PhysicsVehicle=false -ansimalloc -Game.MaxFrameRate=35 -ShutDownServicePort=53003

## Examples of The Front Manager (windows tool)

[Example Start Command](./example_start_command_windows.md)

[Windows Server config file](./generated_server_config_file_windows.md)