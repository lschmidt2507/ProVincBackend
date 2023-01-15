#! /usr/bin/python3

import time
import sys
import requests

EMULATE_HX711=False

referenceUnit = -185
url = "http://178.254.2.54:5000/api/scale/measurement"

import RPi.GPIO as GPIO
from hx711 import HX711

def cleanAndExit():
    GPIO.cleanup()
    sys.exit()

hx = HX711(5, 6)
hx.set_reading_format("MSB", "MSB")

# HOW TO CALCULATE THE REFFERENCE UNIT
# To set the reference unit to 1. Put 1kg on your sensor or anything you have and know exactly how much it weights.
# In this case, 92 is 1 gram because, with 1 as a reference unit I got numbers near 0 without any weight
# and I got numbers around 184000 when I added 2kg. So, according to the rule of thirds:
# If 2000 grams is 184000 then 1000 grams is 184000 / 2000 = 92.
#hx.set_reference_unit(113)
hx.set_reference_unit(referenceUnit)

hx.reset()

hx.tare()

print("Tare done! Add weight now...")

while True:
    try:
        # These three lines are usefull to debug wether to use MSB or LSB in the reading formats
        # for the first parameter of "hx.set_reading_format("LSB", "MSB")".
        # Comment the two lines "val = hx.get_weight(5)" and "print val" and uncomment these three lines to see what it prints.
        
        # np_arr8_string = hx.get_np_arr8_string()
        # binary_string = hx.get_binary_string()
        # print binary_string + " " + np_arr8_string
        
        # Prints the weight. Comment if you're debbuging the MSB and LSB issue.
        val = hx.get_weight(5)
        print(val)
        params = dict(
            authToken="zoW!C3815J1L",
            measurement=val
        )
        try:
            res = requests.post(url, json=params)
            print(res.json())
        except:
            pass
        hx.power_down()
        hx.power_up()
        time.sleep(5)

    except (KeyboardInterrupt, SystemExit):
        cleanAndExit()
