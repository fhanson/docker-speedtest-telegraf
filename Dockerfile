FROM telegraf:alpine as docker-speedtest-telegraf

RUN apk add --no-cache speedtest-cli

RUN speedtest --accept-license
CMD telegraf --config-directory etc/telegraf/telegraf.d
ENTRYPOINT ["/entrypoint.sh"]