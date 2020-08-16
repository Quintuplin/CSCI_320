#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the jumpingOnClouds function below.
def jumpingOnClouds(c):
    clen = len(c)
    steps = 0
    i=0
    while (i < clen):
        if ((i+2)<clen):
            if(c[i+1]==1):
                i+=2
                steps+=1
            elif(c[i+2]==1):
                i+=1
                steps+=1
            else:
                i+=2
                steps+=1
        elif ((i+1)<clen):
            i+=1
            steps+=1
        else:
            i+=1
    return steps

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input())

    c = list(map(int, input().rstrip().split()))

    result = jumpingOnClouds(c)

    fptr.write(str(result) + '\n')

    fptr.close()
