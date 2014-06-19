# redis on trusty

FROM markusma/base:trusty
MAINTAINER Markus Mattinen <docker@gamma.fi>

RUN add-apt-repository ppa:chris-lea/redis-server

RUN apt-get update \
 && apt-get install -y --no-install-recommends redis-server \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/etc/redis/redis.conf /etc/redis/redis.conf

EXPOSE 6379
CMD ["/usr/bin/redis-server", "/etc/redis/redis.conf"]
