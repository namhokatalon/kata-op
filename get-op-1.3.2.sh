#!/bin/bash

KATALON_PLATFORM_INSTALL_DIR=${1:-/tmp/katalon-platform}
echo "KATALON_PLATFORM_INSTALL_DIR: ${KATALON_PLATFORM_INSTALL_DIR}"

mkdir -p ${KATALON_PLATFORM_INSTALL_DIR}
mkdir -p ${KATALON_PLATFORM_INSTALL_DIR}/katone
mkdir -p ${KATALON_PLATFORM_INSTALL_DIR}/testops


######################
### 1.3.2 - katone ###
######################
cd  ${KATALON_PLATFORM_INSTALL_DIR}/katone
mkdir 1.3.2
cd 1.3.2
curl -O https://katalon-one-build.s3.amazonaws.com/op/1.3.2/license-server.zip
unzip -o license-server.zip
cd license-server
docker load < images.tar.gz


######################
### 1.7.2 - katone ###
######################
cd  ${KATALON_PLATFORM_INSTALL_DIR}/katone
mkdir 1.7.2
cd 1.7.2
curl -O https://katalon-one-build.s3.amazonaws.com/op/1.7.2/license-server.zip
unzip -o license-server.zip
cd license-server
docker load < images.tar.gz

 # tagging 1.7.2 images, which don't have a tag
 # other than latest for some reason
docker tag katone-server:latest katone-server:1.7.2
docker tag katone-license:latest katone-license:1.7.2
docker tag katone-proxy:latest katone-proxy:1.7.2


# 1.9.1 = katone
# pull down install binaries and load container images
######################
### 1.9.1 - katone ###
######################
##
## NOTE: the 1.9.1 containers on S3 are actually the 1.10 images!!
##
cd  ${KATALON_PLATFORM_INSTALL_DIR}/katone
mkdir 1.9.1
cd 1.9.1
curl -O https://katalon-one-build.s3.amazonaws.com/op/1.9.1/license-server.zip
unzip -o license-server.zip
cd license-server
docker load < images.tar.gz

# Add 1.9.1 tag
docker tag katone-server:1.10.0 katone-server:1.9.1
docker tag katone-license:1.10.0 katone-license:1.9.1
docker tag katone-proxy:1.10.0 katone-proxy:1.9.1


# latest = katone
# pull down install binaries and load container images
######################
### latest - katone ###
######################
# Katone run one container wit tag license-server:latest 
cd  ${KATALON_PLATFORM_INSTALL_DIR}/katone
mkdir latest
cd latest
curl -O https://katalon-one-build.s3.amazonaws.com/op/latest/license-server.zip
unzip -o license-server.zip
cd license-server
docker load < images.tar.gz



mkdir -p ${KATALON_PLATFORM_INSTALL_DIR}/testops

# TestOps - 0.1
# pull down install binaries and load container images
cd  ${KATALON_PLATFORM_INSTALL_DIR}/testops
mkdir TestOps-OP-0.1
cd TestOps-OP-0.1
curl -O https://katalon-analytics.s3.amazonaws.com/on-premises-image/TestOps-OP-0.1/testops.zip
unzip -o testops.zip
cd on-premises
docker load < testops.tar


# TestOps - 1.0
# pull down install binaries and load container images
cd  ${KATALON_PLATFORM_INSTALL_DIR}/testops
mkdir TestOps-OP-1.0
cd TestOps-OP-1.0
curl -O https://katalon-analytics.s3.amazonaws.com/on-premises-image/releases/TestOps-OP-1.0/testops.zip
unzip -o testops.zip
cd on-premises
docker load < testops.tar.gz

# TestOps - 1.2
# pull down install binaries and load container images
cd  ${KATALON_PLATFORM_INSTALL_DIR}/testops
mkdir TestOps-OP-1.2
cd TestOps-OP-1.2
curl -O https://katalon-analytics.s3.amazonaws.com/on-premises-image/releases/TestOps-OP-1.2/testops.zip
unzip -o testops.zip
cd on-premises
docker load < testops.tar.gz

 # tagging 1.2 images, which don't have a latest tag
docker tag testops-engine:TestOps-OP-1.2 testops-engine:latest
docker tag testops:TestOps-OP-1.2 testops:latest
