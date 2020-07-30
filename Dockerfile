FROM alpine

ADD bash/ /bash/
RUN echo TEST

CMD bash/run.sh