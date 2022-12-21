#!/bin/bash

## Katone version: 1.3.2 / 1.7.2 / 1.9.1 / latest
kversion="1.3.2"

## Katone start
cd /tmp/katalon-platform/katone/${kversion}/license-server/
pwd
docker-compose up -d
docker ps

echo ""
echo "Katone URL: http://ec2-3-217-220-83.compute-1.amazonaws.com"
