import RPi.GPIO as gpio
import os
from time import clock
import apa102
from config import numPixels

REBOOT_PIN = 5
thresh = 0.3

gpio.setmode(gpio.BCM)
gpio.setup(REBOOT_PIN, gpio.IN, pull_up_down = gpio.PUD_UP)

Shutdown = None

mutt = 0
lastClock = 0
def Butt(channel):
  global mutt, lastClock, thresh
  if gpio.input(REBOOT_PIN):
    if mutt == 2:
      print "ignore doubled stop"
      return # was already stop, so something is fucked up
    else: 
      if (clock() - lastClock) > thresh:
        strip.clearStrip()
        Shutdown(channel)
      else:
        Shutdown(channel)

    mutt = 2 #rising (stop)
  else:
    print "start"
    mutt = 1 #falling (start)
    lastClock = clock()

def init(shutdown_func):
  print shutdown_func
  global Shutdown
  Shutdown = shutdown_func
  gpio.add_event_detect(REBOOT_PIN, gpio.BOTH, callback = Butt)
