# fiat lux!

#visudo:
www-data ALL = NOPASSWD: /usr/lib/cgi-bin/livolo, /usr/bin/python

#/boot/config.txt
dtoverlay=w1-gpio

#Board pin numbers:

#poweron:
25,26 to optocoupler in ( computers poweron pins to optocupler out)

#temp:
https://www.circuitbasics.com/raspberry-pi-ds18b20-temperature-sensor-tutorial/
https://pinout.xyz/pinout/1_wire
RPI pin 7 is connected to ds18b20 data pin

#light
does not really work:
    https://www.instructables.com/id/Controlling-a-Livolo-RF-Light-Switch-Using-a-Raspb/		- 
this one works:
    https://github.com/platenspeler/LamPI-3.x/tree/master/transmitters/livolo
    but had to be adjusted - the end result is in livolo folder
RPI pin 15 is connected to rf433 data pin
