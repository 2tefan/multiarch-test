FROM busybox

ADD bash/ /bash/
RUN /bash/main.sh
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log

CMD bash/run.sh