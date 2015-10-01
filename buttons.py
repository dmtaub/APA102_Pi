import RPi.GPIO as gpio
import os
from time import clock

REBOOT_PIN = 3
thresh = 0.3

gpio.setmode(gpio.BCM)
#gpio.setup(REBOOT_PIN, gpio.IN, pull_up_down = gpio.PUD_UP)
gpio.setup(REBOOT_PIN, gpio.IN )

LongShutdown = None
ShortShutdown = None

mutt = 0
lastClock = -1
def Butt(channel):
  #TODO: delay on start
  global mutt, lastClock, thresh
  if gpio.input(REBOOT_PIN):
    if mutt == 2:
      print "ignore doubled stop"
      return # was already stop, so something is fucked up
    else: 
      # warning: doesn't handle case where stop called before start
      if (clock() - lastClock) > thresh:
        LongShutdown(channel)
      else:
        ShortShutdown(channel)

    mutt = 2 #rising (stop)
  else:
    print "start"
    mutt = 1 #falling (start)
    # only set lastClock if it hasn't been set before
    if lastClock == -1:
      lastClock = clock()

def init(sd1,sd2):
  global LongShutdown, ShortShutdown
  LongShutdown = sd1
  ShortShutdown = sd2
  gpio.add_event_detect(REBOOT_PIN, gpio.BOTH, callback = Butt)
