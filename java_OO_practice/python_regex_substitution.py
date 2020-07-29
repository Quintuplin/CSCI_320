# import re

# # line = "#Only change those || which have|| ||space ||| on both sides."
# # line = "#Only change those && which & have&& &&space &&& on both sides."
# line = "x&& &&& && && x && || | ||\|| x"

# print(line)
# print(re.sub(r"(\s\&\&\s)", " and ", re.sub(r"(\s\&\&\s)", " and ", line)))
# print(re.sub(r"(\s\|\|\s)", " or ", re.sub(r"(\s\|\|\s)", " or ", re.sub(r"(\s\&\&\s)", " and ", re.sub(r"(\s\&\&\s)", " and ", line)))))

import re

n = input()

for i in range(int(n)):
    line = input()

    print(re.sub(r"(\s\|\|\s)", " or ", re.sub(r"(\s\|\|\s)", " or ", re.sub(r"(\s\&\&\s)", " and ", re.sub(r"(\s\&\&\s)", " and ", line)))))