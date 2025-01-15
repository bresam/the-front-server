# update steam and server installation
steamcmd +force_install_dir /home/gameserver/the_front +login anonymous +app_update 2334200 validate +quit

# set gameserver as owner of server files
chown -R gameserver:gameserver /home/gameserver/the_front

# start the front gameserver
su -c '/home/gameserver/the_front/ProjectWar/Binaries/Linux/TheFrontServer ProjectWar ProjectWar_Start?Listen?MaxPlayers=100 \
  -UserDir="/home/gameserver/the_front/game_storage/$FRONT_CONFIG_SERVER_NAME/" \
  -server \
  -game \
  -QueueThreshold="$FRONT_MAX_PLAYERS" \
  -ServerName="$FRONT_SERVER_NAME" \
  -ServerTitle="$FRONT_SERVER_TITLE" \
  -ConfigServername="$FRONT_CONFIG_SERVER_NAME" \
  -OutIpAddress="$FRONT_OUT_IP_ADDRESS" \
  -port="$FRONT_PORT_GAME" \
  -BeaconPort="$FRONT_PORT_BEACON" \
  -QueryPort="$FRONT_PORT_QUERY" \
  -ShutDownServicePort="$FRONT_PORT_SHUTDOWN_SERVICE" \
  -ServerPassword="$FRONT_SERVER_PASSWORD" \
  -log \
  -locallogtimes \
  -EnableParallelCharacterMovementTickFunction \
  -EnableParallelCharacterTickFunction \
  -UseDynamicPhysicsScene \
  -Game.PhysicsVehicle=false \
  -ansimalloc \
  -Game.MaxFrameRate=35' gameserver
