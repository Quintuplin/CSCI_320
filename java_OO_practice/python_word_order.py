numlines = input()

valsdict = {}

for i in range(int(numlines)):
    line = input()
    if (line in valsdict):
        valsdict[line]+=1
    else:
        valsdict[line]=1
print(len(valsdict))

summary = ''
for count in valsdict.values():
    summary += str(count) + ' '
print(summary[:-1])
