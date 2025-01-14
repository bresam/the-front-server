FROM steamcmd/steamcmd:ubuntu-24

LABEL org.opencontainers.image.authors="Samuel Breu <samuel@breu.cloud>"
LABEL org.opencontainers.image.source="https://github.com/bresam/the-front-server"
LABEL org.opencontainers.image.documentation="https://github.com/bresam/the-front-server"
LABEL org.opencontainers.image.licenses="GPL-3.0"

# create user gameserver
RUN groupadd -g 10000 gameserver && useradd -rm -d /home/gameserver -s /bin/bash -g gameserver -u 10000 gameserver

ENV FRONT_SERVER_NAME="THE FRONT by bresam" \
    FRONT_SERVER_TITLE="Docker image at https://hub.docker.com/r/bresam/the-front-game-server" \
    FRONT_MAX_PLAYERS=10 \
    FRONT_PORT_GAME=53000 \
    FRONT_PORT_BEACON=53001 \
    FRONT_PORT_QUERY=53002 \
    FRONT_PORT_SHUTDOWN_SERVICE=53003 \
    FRONT_SERVER_PASSWORD=""

# entrypoint file
COPY entrypoint.sh /entrypoint.sh
RUN chmod 500 /entrypoint.sh

# initial gameserver installation
RUN steamcmd +force_install_dir /home/gameserver/the_front +login anonymous +app_update 2334200 validate +quit

# entrypoint file
ENTRYPOINT /entrypoint.sh
