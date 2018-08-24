#!/bin/sh

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account>"
	exit 1
elif [ ! -f /etc/local/.cloud/alibaba/$1.sh ]; then
	echo "error: cloud account \"$1\" not configured"
	exit 1
fi

account=$1
aliyuncli ecs DescribeImages --profile $account |grep ImageId |awk '{ print $2 }' |sed -e s/\"//g -e s/,//g |grep -v winsvr |grep -v _32_ |sort
