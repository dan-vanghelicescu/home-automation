from time import sleep
import RPi.GPIO as GPIO
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)

pin = 26

GPIO.setup(pin, GPIO.OUT)
GPIO.output(pin,1)
sleep(0.5)
GPIO.output(pin,0)
