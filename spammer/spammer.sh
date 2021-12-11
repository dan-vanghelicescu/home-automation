#!/bin/bash

function send_mail {

    echo "subject: Money 4 mr musk" > msg.txt
    echo $uptime >> msg.txt
    echo $date >> msg.txt
    echo "Elon Musket must need ur money" >> msg.txt

    curl --ssl-reqd \
    --url 'smtps://smtp.gmail.com:465' \
    --user 'rubusidaeus31415@gmail.com:dani1024' \
    --upload-file msg.txt
}

while true; do
	send_mail
	done

