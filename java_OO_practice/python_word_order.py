numlines = input()

lines = []
for i in range(int(numlines)):
    line = input()
    lines.append(str(line))

setlines = set(lines)
print(len(setlines))

summary = ''
for line in lines:
    if line in setlines:
        countword = lines.count(line)
        summary += str(countword) + ' '
        setlines.remove(line)
print(summary[:-1])

# TODO: too slow on very large inputs, correct otherwise