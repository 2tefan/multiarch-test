FROM busybox

ADD bash/ /bash/
RUN /bash/main.sh