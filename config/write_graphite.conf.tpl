LoadPlugin write_graphite

<Plugin "write_graphite">
  <Carbon>
    Host "{{ GRAPHITE_HOST | default("127.0.0.1") }}"
    Port "{{ GRAPHITE_PORT | default("2003") }}"
    EscapeCharacter "_"
    SeparateInstances true
    StoreRates true
    AlwaysAppendDS false
    Prefix ""
  </Carbon>
</Plugin>
