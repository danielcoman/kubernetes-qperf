#!/bin/sh

iteration=1
t=10

echo "Running as ${SERVICE_TYPE}"
echo "SERVER_ADDR ${SERVER_ADDR}"
echo "SERVER_PORT ${SERVER_PORT}"


if [ ${SERVICE_TYPE} == "server" ] ; then
  qperf -lp ${SERVER_PORT}
elif [ ${SERVICE_TYPE} == "client" ] ; then
  while true ; do
    sleep 1
    t=$(shuf -i ${QPERF_INTERVAL} -n 1)
      lat=$(qperf -t ${t} --use_bits_per_sec ${SERVER_ADDR} -lp ${SERVER_PORT} tcp_lat | grep "latency")
    echo "iteration:${iteration}  t:${t} ${lat}"
    let iteration++
  done
elif [ ${SERVICE_TYPE} == "ping" ] ; then
  sleep 1
  ping -i 5 ${SERVER_ADDR} | awk  -F'='  '{print$4}'
fi
