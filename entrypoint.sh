# update steam and server installation
steamcmd +force_install_dir /home/gameserver/the_front +login anonymous +app_update 2334200 validate +quit

# set gameserver as owner of server files
chown -R gameserver:gameserver /home/gameserver/the_front

# start the front gameserver
su -c '/home/gameserver/the_front/ProjectWar/Binaries/Linux/TheFrontServer ProjectWar \
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
  -port="$FRONT_PORT_GAME" \
  -BeaconPort="$FRONT_PORT_BEACON" \
  -QueryPort="$FRONT_PORT_QUERY" \
  -ShutDownServicePort="$FRONT_PORT_SHUTDOWN_SERVICE" \
  -Game.PhysicsVehicle=false \
  -ansimalloc \
  -Game.MaxFrameRate=35 \
  -ServerPassword="$FRONT_SERVER_PASSWORD"' gameserver
