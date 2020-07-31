FROM --platform=$BUILDPLATFORM busybox

ARG TARGETPLATFORM
ARG BUILDPLATFORM

ADD bash/ /bash/
RUN /bash/main.sh
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" 

CMD bash/run.sh