180621: 7392 Reza Farrahi (imriss@yahoo.com) 
# P1. Custom Datadog metrics of a service via Docker

## Context: 
1. You have a Docker Compose with a few containers running.
2. There is a service exposed via container "cool_service_container" on port "12341".
   - The "cool_service_container" reports the status of its service via: "http://cool_service_container:12341/cool-service-root/service/isRunning"
3. The output of the status URL is a JSON in which the status is reported by setting "running" to "true" or "false".
4. We want to retrieve the status of "cool_service_container" via another container called "awesome_container".
5. The datadag agent is provided via a Docker container.

## Additions:
1. The Datadog metrics "coolservice.coolservice_status" is used to report the status.
    - If the status is "true", the metrics is set to 100, else if the status is "false" it is set to 30, and otherwise it is set to 20.

## Extra steps:
1. The file "coolservice_put.sh" should be placed at "/usr/local/bin/"
2. A Cron job is needed to extecute "/usr/local/bin/coolservice_put.sh" every minute.
