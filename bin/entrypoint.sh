#!/bin/bash

chown -R redis:redis /var/lib/redis
exec gosu redis "$@"
