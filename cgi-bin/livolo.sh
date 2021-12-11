#!/bin/bash

if [ 1 -ge 2 ]; then
	date +"%Y-%m-%d %H:%M:%S.%3N" >> /usr/lib/cgi-bin/livolosh.log
	echo $QUERY_STRING >> /usr/lib/cgi-bin/livolosh.log
	btn=`echo "$QUERY_STRING" | grep -oE "(^|[?&])button=[0-9]+" | cut -f 2 -d "=" | head -n1`
	echo "value:$btn" >> /usr/lib/cgi-bin/livolosh.log
fi

button=`echo "$QUERY_STRING" | grep -oE "(^|[?&])button=[0-9]+" | cut -f 2 -d "=" | head -n1`
sudo ./livolo -n$button
echo "Content-type: text/html\n"
