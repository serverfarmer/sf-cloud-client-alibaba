#!/bin/sh

/opt/farm/ext/packages/utils/install.sh libyaml-dev libpython-dev python-yaml python-pip

echo "checking for pip package aliyun-python-sdk-ecs"
if [ "`pip list |grep aliyun-python-sdk-ecs`" = "" ]; then
	pip install aliyuncli aliyun-python-sdk-ecs
else
	pip install --upgrade aliyuncli aliyun-python-sdk-ecs
fi

/opt/farm/scripts/setup/extension.sh sf-php

echo "setting up base directory"
mkdir -p /etc/local/.cloud/alibaba
