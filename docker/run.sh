#!/bin/sh

XSOCK=/tmp/.X11-unix
XAUTH=/home/$USER/.Xauthority
SHARED_DIR=/home
HOST_DIR=/home/$USER/shared_dir


docker run \
    -it --rm \
    --volume=$XSOCK:$XSOCK:rw \
    --volume=$XAUTH:$XAUTH:rw \
    --volume=$HOST_DIR:$SHARED_DIR:rw \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY=${DISPLAY}" \
    --net=host \
    --device=/dev/video0:/dev/video0:rmw \
    --privileged -v /dev/bus/usb:/dev/bus/usb \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    -v /usr/lib/nvidia-418:/usr/lib/nvidia-418 \
    -v /usr/lib32/nvidia-418:/usr/lib32/nvidia-418 \
    --device /dev/dri \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --runtime=nvidia \
    infogail
