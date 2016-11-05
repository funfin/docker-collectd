LoadPlugin write_tsdb
<Plugin write_tsdb>
  <Node>
    Host           "{{ OPENTSDB_HOST | default("127.0.0.1") }}"
    Port           "{{ OPENTSDB_PORT | default("4242") }}"
    HostTags       "status=production deviceclass=www"
    StoreRates     false
    AlwaysAppendDS false
  </Node>
</Plugin>
