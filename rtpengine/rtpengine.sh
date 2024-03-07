#!/bin/bash

/usr/sbin/rtpengine-iptables-setup start
/usr/bin/rtpengine -f -E --no-log-timestamps --pidfile /run/rtpengine/rtpengine-daemon.pid --config-file /etc/rtpengine/rtpengine.conf