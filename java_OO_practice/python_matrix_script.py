import math
import os
import random
import re
import sys

invals = [r'7 3',r'Tsi',r'h%x',r'i #',r'sM ',r'$a ',r'#t%',r'ir!']
first_multiple_input = invals[0].rstrip().split()


n = int(first_multiple_input[0])

m = int(first_multiple_input[1])

matrix = []

for i in range(n):
    matrix_item = invals[i+1]
    matrix.append(matrix_item)

outstring = ""

for i in range(len(matrix[0])):
    for j in range(len(matrix)):
        outstring+=matrix[j][i]

print(re.sub('([0-9a-zA-Z])([^0-9a-zA-Z]+)([0-9a-zA-Z])', r'\1 \3', outstring))

# solved with numbered grouping!