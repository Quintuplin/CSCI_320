def merge_the_tools(string, k):
    outstr = ''
    for i in range(len(string)):
        if (string[i] not in outstr):
            outstr += string[i]
        if (i%k == 0):
            outstr = string[i]
        if (i%k == k-1):
            print(outstr)

if __name__ == '__main__':