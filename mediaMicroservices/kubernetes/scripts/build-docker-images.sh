EXEC="docker buildx"
USER="adaim"
TAG="latest"
IMAGE="mediamic"

# start from the root folder that is mediaMicroservices/kubernetes
$EXEC create --name mybuilder --use

$EXEC build -t "localhost:5000/$USER"/"$IMAGE":"$TAG" -f Dockerfile . --platform linux/amd64 --load
docker image push "localhost:5000/$USER"/"$IMAGE":"$TAG"
echo "$IMAGE has been built and pushed to localhost:5000"
