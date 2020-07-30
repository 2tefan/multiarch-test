FROM busybox

ADD bash/ /bash/
RUN /bash/main.sh

CMD bash/run.sh