#!/bin/bash

## Katone version: 1.3.2 / 1.7.2 / 1.9.1 / latest
kversion="latest"

## Get latest docker images
if [ "$kversion" = "latest" ]
then
	echo "Download latest docker image of Katone"
	docker rmi license-server:latest
	mkdir /tmp/kimages/
	cd /tmp/kimages/ 
	curl -O https://katalon-one-build.s3.amazonaws.com/op/latest/license-server.zip
	unzip -o license-server.zip
	cd license-server
	docker load < images.tar.gz
	rm -rf /tmp/kimages/
fi


## Katone start
cd /tmp/katalon-platform/katone/${kversion}/license-server/
pwd
docker-compose up -d
docker ps

echo ""
echo "Katone URL: http://ec2-3-217-220-83.compute-1.amazonaws.com"
