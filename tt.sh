#!/bin/bash

raspberry_ip=192.168.0.12 
ip_file=/home/stefan/home_automation/old_ip 
ping_file=/home/stefan/home_automation/ping.txt 
current_ip=$(curl -s ifconfig.me)
[ -f "$ip_file" ] && old_ip=$(<$ip_file) || old_ip="0.0.0.0"
[ -f "$ping_file" ] && old_status=$(<$ping_file) || old_status="schrodinger"
ping -c 1 -w 1 $raspberry_ip && current_status="alive" || current_status="dead"
[ "$current_status" != "$old_status" ] && echo $current_status > $ping_file && subject="$raspberry_ip is $current_status" || subject=""
[ "$current_ip" != "$old_ip" ] && subject="The IP has changed" && echo $current_ip>$ip_file
[ "$current_status" != "$old_status" ] && [ "$current_ip" != "$old_ip" ] && subject="$raspberry_ip is $current_status and the IP has changed"
[ "$1" == "mail_zilnic" ] && subject="daily"

if [ ! -z "$subject" ]; then
    echo "subject: $subject" > msg.txt
    echo "IP Address $current_ip" >> msg.txt
    echo "$raspberry_ip status: $current_status" >> msg.txt
    echo $(uptime) >> msg.txt
    echo $(date) >> msg.txt
    echo "$current_ip:4280" >> msg.txt

    curl --ssl-reqd \
    --url 'smtps://smtp.gmail.com:465' \
    --user 'rubusidaeus31415@gmail.com:dani1024' \
    --mail-rcpt	'vanghelicescu@gmail.com' \
    --mail-rcpt 'stefan.vanghelicescu@gmail.com' \
    --mail-rcpt 'georgeta.vanghelicescu@gmail.com' \
    --upload-file msg.txt
fi
