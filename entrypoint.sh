#!/bin/sh

# update steam and server installation
if [ "$FRONT_SERVER_AUTO_UPDATE_ON_START" = "true" ]
then
  echo "run auto server update"
  steamcmd +force_install_dir /home/gameserver/the_front +login anonymous +app_update 2334200 validate +quit
else
  echo "skip auto server update"
fi

# set user "gameserver" as owner of server files
sudo chown -R gameserver:gameserver /home/gameserver/the_front

# build start cmd
start_cmd="/home/gameserver/the_front/ProjectWar/Binaries/Linux/TheFrontServer ProjectWar ProjectWar_Start?Listen?MaxPlayers=100 \
  -UserDir=\"/home/gameserver/the_front/game_storage/$FRONT_CONFIG_SERVER_NAME/\" \
  -server \
  -game \
  -QueueThreshold=$FRONT_MAX_PLAYERS \
  -ServerName=\"$FRONT_SERVER_NAME\" \
  -ServerTitle=\"\n$FRONT_SERVER_TITLE\n\" \
  -ConfigServername=\"$FRONT_CONFIG_SERVER_NAME\" \
  -OutIpAddress=\"$FRONT_OUT_IP_ADDRESS\" \
  -port=$FRONT_PORT_GAME \
  -BeaconPort=$FRONT_PORT_BEACON \
  -QueryPort=$FRONT_PORT_QUERY \
  -ShutDownServicePort=$FRONT_PORT_SHUTDOWN_SERVICE \
  -ServerAdminAccounts=\"$FRONT_SERVER_ADMIN_ACCOUNTS\" \
  -log \
  -locallogtimes \
  -EnableParallelCharacterMovementTickFunction \
  -EnableParallelCharacterTickFunction \
  -UseDynamicPhysicsScene \
  -ansimalloc \
  -Game.PhysicsVehicle=$FRONT_GAME_PHYSICS_VEHICLE \
  -Game.MaxFrameRate=$FRONT_GAME_MAX_FRAME_RATE \
  "

if [ -n "$FRONT_SERVER_PASSWORD" ]
then
  echo "Server password defined as: "$FRONT_SERVER_PASSWORD""
  start_cmd="$start_cmd -ServerPassword=\"$FRONT_SERVER_PASSWORD\""
else
  echo "Server password is empty, set none"
fi

# check start cmd
#echo "$start_cmd"

# start the front game server
sudo su - gameserver -c "$start_cmd"
