from kinet import *
import time

# Our ethernet attached power supply.
pds = PowerSupply("192.168.1.244")
numLights = 50
fix = [None]*numLights
# Our light fixtures
for i in range(0,numLights):
    fix[i] = FixtureRGB(0+3*i)

# Attach our fixtures to the power supply
for i in range(0,numLights):
    pds.append(fix[i])

while 1:
    steps = 5000
    pause = 0.1
    ratio = 0 
    for step in range(steps):
        for fixture in fix:
            ratio += (step) % steps / float(steps)
            fixture.hsv = (ratio, 1.0, 1.0)
        print pds
        pds.go()
        time.sleep(pause)
