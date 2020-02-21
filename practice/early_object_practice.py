def cellCompete(states, days):
    for i in range(days):
        output = list(states)
        for j in range(len(states)):
            if j == 0:
                output[j] = states[1]
            elif j == len(states)-1:
                output[j] = states[-2]
            else:
                output[j] = int(states[j-1]!=states[j+1])
        states = output
    return output

def findGCD(x, y):
    while y:
        x, y = y, x % y
    return x

def generalizedGCD(num, arr):
    gcd = arr[0]
    for num in arr:
        gcd = findGCD(gcd, num)
    return gcd