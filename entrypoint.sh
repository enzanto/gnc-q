#!/bin/bash
env >> /etc/environment
touch /logfile 
apt update
apt install -y gnucash 
apt install -y libdbi1 libdbi-dev 
apt install -y libdbd-pgsql 
exec cron -f