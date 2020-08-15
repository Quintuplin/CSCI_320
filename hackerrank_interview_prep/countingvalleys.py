#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the countingValleys function below.
def countingValleys(n, s):
    elev = 0
    valleys = 0
    for letter in s:
        prevelev = elev

        if(s=='U'):
            elev+=1
        elif(s=='D'):
            elev-=1

        if(prevelev == 0 and elev == -1):
            print("valley")
            valleys +=1

    return valleys

if __name__ == '__main__':
    print(countingValleys(12,'DDUUDDUDUUUD'))
