LoadPlugin network

<Plugin network>
    Server "{{ LOGSTASH_HOST | default("127.0.0.1") }}" "{{ LOGSTASH_PORT | default("25826") }}"
</Plugin>
