FROM steamcmd/steamcmd:ubuntu-24

LABEL org.opencontainers.image.authors="Samuel Breu <samuel@breu.cloud>"
LABEL org.opencontainers.image.source="https://github.com/bresam/the-front-server"
LABEL org.opencontainers.image.documentation="https://github.com/bresam/the-front-server"
LABEL org.opencontainers.image.licenses="GPL-3.0"

ENV FRONT_SERVER_NAME="THE FRONT by bresam" \
    FRONT_SERVER_TITLE="You can find this server docker image at https://hub.docker.com/r/bresam/the-front-game-server" \
    FRONT_CONFIG_SERVER_NAME="change_this_to_a_unique_value" \
    FRONT_MAX_PLAYERS=10 \
    FRONT_OUT_IP_ADDRESS="change_this_to_servers_public_ip_address" \
    FRONT_PORT_GAME=5500 \
    FRONT_PORT_BEACON=5501 \
    FRONT_PORT_SHUTDOWN_SERVICE=5502 \
    FRONT_PORT_QUERY=27015 \
    FRONT_SERVER_PASSWORD="" \
    FRONT_SERVER_AUTO_UPDATE_ON_START="true" \
    FRONT_SERVER_ADMIN_ACCOUNTS="" \
    FRONT_GAME_PHYSICS_VEHICLE="false" \
    FRONT_GAME_MAX_FRAME_RATE=35

# sudo and users
RUN apt-get update && \
  apt-get install -y sudo && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* && \
  usermod -aG sudo ubuntu && \
  groupadd -g 10000 gameserver && \
  useradd -rm -d /home/gameserver -s /bin/bash -g gameserver -u 10000 gameserver && \
  echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/ubuntu && \
  chmod 0440 /etc/sudoers.d/ubuntu

# reduce privileges with ubuntu user
USER ubuntu

# initial gameserver installation
RUN sudo steamcmd +force_install_dir /home/gameserver/the_front +login anonymous +app_update 2334200 validate +quit

# entrypoint file
COPY --chown=ubuntu entrypoint.sh /entrypoint.sh
RUN chmod 500 /entrypoint.sh

VOLUME ["/home/gameserver/the_front/game_storage"]

# entrypoint file
ENTRYPOINT /entrypoint.sh
