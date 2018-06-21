#!/bin/bash
# 180621: Reza Farrahi (imriss@yahoo.com)

mkdir -p /shared-mount-point/coolservice-status/;
coolservice_stats_docker=`/usr/bin/docker exec awesome_container curl -s --connect-timeout 10 -XGET http://cool_service_container:12341/cool-service-root/service/isRunning 2>&1 | grep running | jq ' .running ' | tr -d '\n'`;
# echo $coolservice_stats_docker;
if [ $coolservice_stats_docker = 'true' ]; then
    coolservice_stats_value=100
  elif [ $coolservice_stats_docker = 'false' ]; then
    coolservice_stats_value=30
  else
    coolservice_stats_value=20
fi
echo $coolservice_stats_value >/shared-mount-point/coolservice-status/coolservice-status.status
