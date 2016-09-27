Hostname "{{ HOST_NAME | default(HOSTNAME) }}"
FQDNLookup false
Interval "{{ RUN_INTERVAL | default(10) }}"
Timeout 2
ReadThreads 10
WriteThreads 10
# Avoid memory issue if one of the write plugins is slow (e.g. graphite)
WriteQueueLimitHigh 250000
WriteQueueLimitLow 250000

<Include "/etc/collectd/plugins.conf.d">
    Filter "*.conf"
</Include>

<Include "/etc/collectd/collectd.conf.d">
    Filter "*.conf"
</Include>
