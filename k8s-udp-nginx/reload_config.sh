#!/bin/sh
while :
do
	sleep 30
	/usr/local/sbin/nginx -s reload
done