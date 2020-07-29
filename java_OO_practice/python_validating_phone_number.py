import re

n = input()

for i in range(int(n)):
    num = input()

    if (re.match(r"^[7-9][0-9]{9}$", num)):
        print("YES")
    else:
        print("NO")
