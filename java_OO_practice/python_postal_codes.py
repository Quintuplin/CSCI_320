regex_integer_in_range = r"^[1-9]([0-9]){5}$"	# Do not delete 'r'.
regex_alternating_repetitive_digit_pair = r"(?=1[0-9]1)|(?=2[0-9]2)|(?=3[0-9]3)|(?=4[0-9]4)|(?=5[0-9]5)|(?=6[0-9]6)|(?=7[0-9]7)|(?=8[0-9]8)|(?=9[0-9]9)|(?=0[0-9]0)"	# Do not delete 'r'.


import re
# P = "121256"
# P = "110000"
P = "4542867"

print (bool(re.match(regex_integer_in_range, P))
and len(re.findall(regex_alternating_repetitive_digit_pair, P)) < 2)

print("because: " +str(len(re.findall(regex_alternating_repetitive_digit_pair, P))))
print('with: ' +str(re.findall(regex_alternating_repetitive_digit_pair, P)))

# notes:
# ^ indicates string start
# $ indicates string end
# this is necessary to string length the range check

# ?= within a pattern indicates check every possible offset
# this is necessary to get 2 pattern matches for '1212' rather than getting the one for '121' then missing the second because all matched letters are by default skipped in future checks