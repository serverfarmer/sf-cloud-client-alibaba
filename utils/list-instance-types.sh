#!/bin/sh

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account> [--full]"
	exit 1
elif [ ! -f /etc/local/.cloud/alibaba/$1.sh ]; then
	echo "error: cloud account \"$1\" not configured"
	exit 1
fi

account=$1

if [ "$2" = "--full" ]; then
	aliyuncli ecs DescribeInstanceTypes --profile $account
else
	aliyuncli ecs DescribeInstanceTypes --profile $account |grep InstanceTypeId |awk '{ print $2 }' |sed -e s/\"//g -e s/,//g
fi
