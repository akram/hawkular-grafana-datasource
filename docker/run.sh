#!/bin/bash -e

: "${GF_PATHS_DATA:=/var/lib/grafana}"
: "${GF_PATHS_LOGS:=/var/log/grafana}"
: "${GF_PATHS_PLUGINS:=/var/lib/grafana/plugins}"
: "${GF_DASHBOARDS_ENABLED:=true}"
: "${GF_DASHBOARDS_PATH:=/var/lib/grafana/dashboards}"

exec /usr/sbin/grafana-server                               \
  --homepath=/usr/share/grafana                             \
  --config=/etc/grafana/grafana.ini                         \
  cfg:default.paths.data="$GF_PATHS_DATA"                   \
  cfg:default.paths.logs="$GF_PATHS_LOGS"                   \
  cfg:default.dashboards.json.enabled=GF_DASHBOARDS_ENABLED \
  cfg:default.dashboards.json.path="$GF_DASHBOARDS_PATH"    \
  cfg:default.paths.plugins="$GF_PATHS_PLUGINS"
