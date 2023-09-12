#!/bin/bash

weather() { curl -s --connect-timeout 3 -m 5 http://wttr.in/$1; }
weather
