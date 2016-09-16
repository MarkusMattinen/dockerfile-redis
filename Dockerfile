# Redis and supervisord on Ubuntu Trusty

FROM markusma/supervisord:ubuntu-trusty
MAINTAINER Markus Mattinen <docker@gamma.fi>

RUN add-apt-repository ppa:chris-lea/redis-server \
 && apt-get update \
 && apt-get install -y --no-install-recommends redis-server \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/etc/redis/redis.conf /etc/redis/redis.conf
ADD config/etc/supervisor/conf.d/redis.conf /etc/supervisor/conf.d/redis.conf

EXPOSE 6379
