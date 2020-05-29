FROM alpine

MAINTAINER cityhawk

RUN apk add --update mrtg 
RUN rm -rf /var/cach/apk/*

RUN apk add tzdata
RUN ls /usr/share/zoneinfo
RUN cp /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
RUN echo "Australia/Melbourne" >  /etc/timezone
RUN date
RUN apk del tzdata

COPY crontab.txt /crontab.txt
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT sh /entrypoint.sh
