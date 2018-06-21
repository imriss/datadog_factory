# 180621 Reza Farrahi (imriss@yahoo.com)
FROM datadog/docker-dd-agent
RUN mkdir -p /opt/datadog-agent/agent/checks.d/
COPY coolservice.yaml /etc/dd-agent/conf.d/coolservice.yaml
COPY coolservice.py /opt/datadog-agent/agent/checks.d/coolservice.py
COPY coolservice.sh /usr/local/bin/coolservice.sh
RUN chmod 700 /usr/local/bin/coolservice.sh
