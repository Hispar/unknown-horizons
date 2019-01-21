#!/usr/bin/env bash

mkdir ./.config/unknown-horizons/
cp ./content/settings-template.xml ./.config/unknown-horizons/settings.xml

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run -ti -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH hispar:uh