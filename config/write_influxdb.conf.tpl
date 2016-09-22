LoadPlugin network

<Plugin network>
        Server "{{ INFLUXDB_ADDR | default("127.0.0.1") }}" "{{ INFLUXDB_PORT | default("8086") }}"
</Plugin>
