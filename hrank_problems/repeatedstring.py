#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the repeatedString function below.
def repeatedString(s, n):
    count = 0
    subcount = 0
    c = len(s)
    nrem = n%c

    for letter in s:
        if letter=='a': subcount += 1
    for i in range(nrem):
        if (s[i%c]=='a'): count += 1
    return count + subcount * int(n//c)

if __name__ == '__main__':
    s = "epsxyyflvrrrxzvnoenvpegvuonodjoxfwdmcvwctmekpsnamchznsoxaklzjgrqruyzavshfbmuhdwwmpbkwcuomqhiyvuztwvq"
    # s="aba"

    n = int(549382313570)
    # n=10

    result = repeatedString(s, n)

    print(result)
