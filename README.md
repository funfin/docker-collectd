## Collectd Docker

This repository contains **Dockerfile** of [Collectd](http://collectd.org/) and other scripts
for [Docker](https://www.docker.com/)'s.

### Base Docker Image

* [puckel/docker-base](https://hub.docker.com/_/debian/)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Pull image from Docker hub(https://hub.docker.com/):

```docker pull puckel/docker-collectd```

3. Alternatively build an image from [Dockerfile](https://github.com/oisis/docker-collectd):

```docker build oisis/collectd .```

### Usage

In addition with puckel/docker-graphite or tutum/influxdb, a basic collectd-based server monitoring. Sends stats to a container named "graphite", "influx" or both. You can specify your collectd hostname with "-e HOST_NAME=YOURHOSTNAME" otherwise "Hostname" in collectd.conf will be the container name :

* Run with Graphite support:
```
docker run -d --link graphite:graphite \
  --name collectd -e HOST_NAME=YOURHOSTNAME \
  -e GRAPHITE_ADDR=127.0.0.1 -e GRAPHITE_PORT=2003 \
  oisis/collectd
```

* Run with InfluxDB support:
```
docker run -d --link influxdb:influxdb \
  --name collectd -e HOST_NAME=YOURHOSTNAME \
  -e INFLUXDB_ADDR=127.0.0.1 -e INFLUXDB_PORT=8086 \
  oisis/collectd
```

Run with OpenTSDB support:
```
docker run -d --link opentsdb:opentsdb \
  --name collectd -e HOST_NAME=YOURHOSTNAME \
  -e OPENTSDB_ADDR=opentsdb -e OPENTSDB_PORT=4242 \
  oisis/collectd
```

### Supported variables:

- `HOST_NAME`: Host name
- `RUN_INTERVAL`: How often to run plugins
- `GRAPHITE_HOST`: Graphite host address(default localhost)
- `GRAPHITE_PORT`: Graphite host port (default 2003)
- `INFLUXDB_HOST`: InfluxDB host address(default localhost)
- `INFLUXDB_PORT`: InfluxDB host port (default 8086)
- `OPENTSDB_HOST`: OpenTSDB host address(default localhost)
- `OPENTSDB_PORT`: OpenTSDB host port (default 4242)
- `LOGSTASH_HOST`: Logstash host address(default localhost)
- `LOGSTASH_PORT`: Logstash host port (default 25826)
