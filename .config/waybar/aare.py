#!/usr/bin/env python

import json
from pyaare.pyaare import PyAare

city = "Bern"

data = {}

aare = PyAare(city=city)
data['text'] = "Aare " + str(aare.tempC) + "°"
data['tooltip'] = f"<b>Aaretemperatur z'Bärn</b>\n"
#  data['tooltip'] += f"Ds letschte öpdeit hets vor {aare.retrievedAt} gä\n"
data['tooltip'] += f"Temperatur: {aare.tempC}\u00b0C  -  {aare.tempText}\n"
data['tooltip'] += f"Wassermängi: {aare.flow} m³/s  -  {aare.flowText}\n"
data['tooltip'] += f"Das Wasser i ca. 2 Stung: {aare.tempC2h}\u00b0C  -  {aare.tempC2hText}"

print(json.dumps(data))
