#!/bin/bash
EXEC="docker buildx"
USER="adaim"
TAG="latest"

# start from the root folder that is hotelReservation/kubernetes
ROOT_FOLDER=$(pwd)
$EXEC create --name mybuilder --use

for i in frontend geo profile rate recommendation reserve search user
do
  IMAGE=${i}
  echo Processing image ${IMAGE}
  cd $ROOT_FOLDER
  $EXEC build -t "$USER"/"$IMAGE":"$TAG" -f Dockerfile . --platform linux/amd64
  cd $ROOT_FOLDER
  echo
done


cd - >/dev/null
