#!/bin/bash

## Katone version
kversion="1.3.2"

## Testops version
tversion="TestOps-OP-0.1"

cd /tmp/katalon-platform/katone/1.3.2/license-server/
docker-compose down

cd /tmp/katalon-platform/katone/1.7.2/license-server/
docker-compose down

cd /tmp/katalon-platform/katone/1.9.1/license-server/
docker-compose down

cd /tmp/katalon-platform/katone/latest/license-server/
docker-compose down
