#!/bin/sh
# https://www.alibabacloud.com/help/doc-detail/40654.htm

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account>"
	exit 1
elif [ ! -f /etc/local/.cloud/alibaba/$1.sh ]; then
	echo "error: cloud account \"$1\" not configured"
	exit 1
fi

account=$1
aliyuncli ecs DescribeRegions --profile $account |grep RegionId |awk '{ print $2 }' |sed -e s/\"//g -e s/,//g
