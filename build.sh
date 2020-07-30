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

docker rmi $IMAGE:$BASETAG-$ARCHITECTURE -f
docker rmi $IMAGE:$BASETAG -f

docker build --tag $IMAGE:$BASETAG-$ARCHITECTURE .
docker push $IMAGE:$BASETAG-$ARCHITECTURE

docker manifest create $IMAGE:$BASETAG --amend $IMAGE:$BASETAG-amd64 --amend $IMAGE:$BASETAG-arm64
# docker manifest create $IMAGE:$BASETAG --amend $IMAGE:$BASETAG-$ARCHITECTURE

docker manifest annotate $IMAGE:$BASETAG $IMAGE:$BASETAG-$ARCHITECTURE --os linux --arch $ARCHITECTURE
# docker manifest annotate $IMAGE $IMAGE:amd64 --os linux --arch amd64
# docker manifest annotate $IMAGE $IMAGE:arm64 --os linux --arch arm64

docker manifest push $IMAGE:$BASETAG --purge