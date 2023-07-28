#!/bin/sh

set -e

echo "Disable IPv6 by Katalon for OP 1.3.2"
sed -i "/[::]:/d" /etc/nginx/conf.d/default.conf
nginx -t
