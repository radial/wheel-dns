#!/bin/bash
set -e

# Misc settings
ERR_LOG=/log/$HOSTNAME/dns_stderr.log


restart_message() {
    echo "Container restart on $(date)."
    echo -e "\nContainer restart on $(date)." | tee -a $ERR_LOG
}

if [ ! -e /tmp/dns_first_run ]; then
    touch /tmp/dns_first_run
else
    restart_message
fi

echo Starting DNS server... | tee -a $ERR_LOG
exec dnsmasq \
    --conf-dir=/config \
    --no-daemon
