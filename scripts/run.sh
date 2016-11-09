#!/bin/bash

HOSTNAME=`cat /etc/hostname`

if [[ $GRAPHITE_HOST && ${GRAPHITE_HOST-x} ]] || [[ $GRAPHITE_PORT && ${GRAPHITE_PORT-x} ]]; then
    envtpl --keep-template /etc/collectd/collectd.conf.d/write_graphite.conf.tpl
fi

if [[ $INFLUXDB_HOST && ${INFLUXDB_HOST-x} ]] || [[ $INFLUXDB_PORT && ${INFLUXDB_PORT-x} ]]; then
    envtpl --keep-template /etc/collectd/collectd.conf.d/write_influxdb.conf.tpl
fi

if [[ $OPENTSDB_ADDR && ${OPENTSDB_HOST-x} ]] || [[ $OPENTSDB_PORT && ${OPENTSDB_PORT-x} ]]; then
    envtpl --keep-template /etc/collectd/collectd.conf.d/tsdb.conf.tpl
fi

if [[ $LOGSTASH_HOST && ${LOGSTASH_HOST-x} ]] || [[ $LOGSTASH_PORT && ${LOGSTASH_PORT-x} ]]; then
    envtpl --keep-template /etc/collectd/collectd.conf.d/write_logstash.conf.tpl
fi

# Prepare Collectd config file
envtpl --keep-template /etc/collectd/collectd.conf.tpl

/usr/sbin/collectd -C /etc/collectd/collectd.conf -f
