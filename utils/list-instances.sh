#!/bin/sh

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account>"
	exit 1
elif [ ! -f /etc/local/.cloud/alibaba/$1.sh ]; then
	echo "error: cloud account \"$1\" not configured"
	exit 1
fi

# TODO: parse output and print single-line instance descriptions, just like for other cloud providers

account=$1
aliyuncli ecs DescribeInstances --profile $account
