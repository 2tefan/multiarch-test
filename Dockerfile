FROM --platform=$BUILDPLATFORM busybox

ARG TARGETPLATFORM
ARG BUILDPLATFORM

ADD bash/ /bash/
RUN /bash/main.sh

CMD bash/run.sh