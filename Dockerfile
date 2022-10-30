FROM telegraf:alpine as docker-speedtest-telegraf

RUN apk add --no-cache speedtest-cli

RUN speedtest --accept-license

COPY ./inputs.speedtest.conf /etc/telegraf/telegraf.d/inputs.speedtest.conf
COPY ./outputs.grafana.conf /etc/telegraf/telegraf.d/outputs.grafana.conf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

CMD telegraf --config-directory etc/telegraf/telegraf.d
ENTRYPOINT ["/entrypoint.sh"]