#!/usr/bin/env python

import re
import sys

regex = r"\(([^()]+)\)"

f = sys.stdin

try:
    fs = f.read()
except:
    sys.exit(1)

result = re.findall(regex, fs, 0)

if result:
    for x in range(len(result)):
        print result[x],
