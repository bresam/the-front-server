# update steam and server installation
steamcmd +force_install_dir /home/gameserver/the_front +login anonymous +app_update 2334200 validate +quit

# start the front gameserver
# TODO: Update actual executable path and running user
# TODO: Check and remove ProjectWar_Start ?Listen?MaxPlayers
./TheFrontServer ProjectWar \
  ProjectWar_Start ?Listen?MaxPlayers="$FRONT_MAX_PLAYERS" \
  -server \
  -game \
  -QueueThreshold="$FRONT_MAX_PLAYERS" \
  -ServerName="$FRONT_SERVER_NAME" \
  -ServerTitle="$FRONT_SERVER_TITLE" \
  -log log=log.log \
  -locallogtimes \
  -EnableParallelCharacterMovementTickFunction \
  -EnableParallelCharacterTickFunction \
  -UseDynamicPhysicsScene \
  -port=53000 \
  -BeaconPort=53001 \
  -QueryPort=53002 \
  -ShutDownServicePort=53003 \
  -Game.PhysicsVehicle=false \
  -ansimalloc \
  -Game.MaxFrameRate=35 \
  -ServerPassword="$FRONT_SERVER_PASSWORD"

