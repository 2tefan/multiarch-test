#!/bin/sh

IMAGE="2tefan/multiarch-test"
BASETAG="test"

case "$(arch)" in
    aarch64)
        ARCHITECTURE="arm64"
	    ;;
    x86_64)
        ARCHITECTURE="amd64"
        ;;
    *)
        echo "ERROR: unsupported architecture: $(arch)"
	    exit 1
	    ;;
esac

docker build --tag $IMAGE:$BASETAG-$ARCHITECTURE .
docker push $IMAGE:$BASETAG-$ARCHITECTURE

docker manifest create $IMAGE:$BASETAG --amend $IMAGE:$BASETAG-amd64 --amend $IMAGE:$BASETAG-arm64
# docker manifest create $IMAGE:$BASETAG --amend $IMAGE:$BASETAG-$ARCHITECTURE

docker manifest annotate $IMAGE:$BASETAG $IMAGE:$BASETAG-$ARCHITECTURE --os linux --arch $ARCHITECTURE
# docker manifest annotate $IMAGE $IMAGE:arm32v7 --os linux --arch arm
# docker manifest annotate $IMAGE $IMAGE:arm64v8 --os linux --arch arm64

docker manifest push $IMAGE:$BASETAG