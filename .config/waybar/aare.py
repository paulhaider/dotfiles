#!/usr/bin/env python

import re
import os
import json
import requests
from datetime import datetime

os.system("")

data = {}

# weather = requests.get()  # .json()

import urllib.request

def escape_ansi(line):
    ansi_escape = re.compile(r'(?:\x1B[@-_]|[\x80-\x9F])[0-?]*[ -/]*[@-~]')
    return ansi_escape.sub('', line)

url = "https://aare.li/"

uf = urllib.request.urlopen(url)
html = uf.read()
string = str(html)
temp = string[string.find('Wasser') + 25:string.find('Wasser') + 29]
data['text'] = "Aare " + temp + "°"
data['tooltip'] = escape_ansi(html.decode())

# print(html.decode())

# data['text'] = weather['nearest_area'][0]['areaName'][0]['value'] + \
#         " "+weather['current_condition'][0]['FeelsLikeC']+"°" + \
#         " "+WEATHER_CODES[weather['current_condition'][0]['weatherCode']]

# data['tooltip'] = f"<b>{weather['current_condition'][0]['weatherDesc'][0]['value']} {weather['current_condition'][0]['temp_C']}°</b>\n"

print(json.dumps(data))
