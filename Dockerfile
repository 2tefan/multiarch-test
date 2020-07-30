FROM busybox

ADD bash/ /bash/
RUN echo TEST

CMD bash/run.sh