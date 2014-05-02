#!/usr/bin/env python
# encoding: utf-8
import sys
short = "-s" in sys.argv[1:] or "--short" in sys.argv[1:]

for i in range(2 if short else 10):
    for j in range(30, 38):
        for k in range(40, 48):
            if short:
                print("\33[%d;%d;%dm%d;%d;%d\33[m " % (i, j, k, i, j, k)),
            else:
                print("%d;%d;%d: \33[%d;%d;%dm Hello, World! \33[m " % (i, j, k, i, j, k, ))

        print ""
