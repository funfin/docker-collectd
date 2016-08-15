#!/bin/bash

if [[ $GRAPHITE_PORT_2003_TCP_PORT && ${GRAPHITE_PORT_2003_TCP_PORT-x} ]]; then
    envtpl /etc/collectd/collectd.conf.d/write_graphite.conf.tpl
elif [[ $INFLUXDB_PORT_25826_UDP_ADDR && ${INFLUXDB_PORT_25826_UDP_ADDR-x} ]]; then
    envtpl /etc/collectd/collectd.conf.d/write_influxdb.conf.tpl
fi

if [[ $OPENTSDB_SERVER_ADDR && ${OPENTSDB_SERVER_ADDR-x} ]]; then
    envtpl /etc/collectd/collectd.conf.d/tsdb.conf.tpl
elif [[ $OPENTSDB_SERVER_PORT && ${OPENTSDB_SERVER_PORT-x} ]]; then
    envtpl /etc/collectd/collectd.conf.d/tsdb.conf.tpl
fi

envtpl /etc/collectd/collectd.conf.tpl
#/usr/bin/supervisord
/usr/sbin/collectd -C /etc/collectd/collectd.conf -f
