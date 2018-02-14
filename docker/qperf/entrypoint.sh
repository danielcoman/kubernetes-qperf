#!/bin/sh

iteration=1
t=0

echo "Running as ${SERVICE_TYPE}"

if [ ${SERVICE_TYPE} == "server" ] ; then
  qperf --listen_port 443
elif [ ${SERVICE_TYPE} == "client" ] ; then
  while true ; do
    sleep 1
    t=$(shuf -i ${QPERF_INTERVAL} -n 1)
      lat=$(qperf -t ${t} --use_bits_per_sec ${SERVER_ADDR} --listen_port 443 tcp_lat | grep "latency")
    echo "iteration:${iteration}  t:${t} ${lat}"
    let iteration++
  done
fi
